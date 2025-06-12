(define-fungible-token green-token)

(define-data-var token-counter uint u0)

(define-map user-energy
  { user: principal }
  { amount: uint }
)

(define-map listings
  { id: uint }
  {
    seller: principal,
    amount: uint,
    price: uint,
    active: bool
  }
)

(define-constant err-not-enough-energy (err u100))
(define-constant err-unauthorized (err u101))
(define-constant err-listing-not-found (err u102))
(define-constant err-not-active (err u103))
(define-constant err-insufficient-payment (err u104))

;; Enerji mintleme
(define-public (mint-energy (amount uint))
  (let (
        (maybe-current (map-get? user-energy { user: tx-sender }))
      )
    (let (
          (current-amount (default-to u0 (get amount maybe-current)))
        )
      (begin
        (map-set user-energy { user: tx-sender } { amount: (+ current-amount amount) })
        (ft-mint? green-token amount tx-sender)
        (ok true)
      )
    )
  )
)

;; Enerji listeleme
(define-public (list-energy (amount uint) (price uint))
  (let (
        (maybe-current (map-get? user-energy { user: tx-sender }))
      )
    (let (
          (current-amount (default-to u0 (get amount maybe-current)))
        )
      (if (>= current-amount amount)
          (let (
                (new-amount (- current-amount amount))
                (id (var-get token-counter))
              )
            (begin
              (map-set user-energy { user: tx-sender } { amount: new-amount })
              (map-set listings { id: id }
                {
                  seller: tx-sender,
                  amount: amount,
                  price: price,
                  active: true
                })
              (var-set token-counter (+ id u1))
              (ok id)
            )
          )
          err-not-enough-energy
      )
    )
  )
)

;; Enerji satın alma
(define-public (buy-energy (id uint))
  (match (map-get? listings { id: id }) listing-data
    (if (not (get active listing-data))
        err-not-active
        (let (
              (price (* (get price listing-data) (get amount listing-data)))
              (seller (get seller listing-data))
              (amount (get amount listing-data))
            )
          (if (< (stx-get-balance tx-sender) price)
              err-insufficient-payment
              (begin
                (try! (stx-transfer? price tx-sender seller))
                (try! (ft-transfer? green-token amount seller tx-sender))
                (map-set listings { id: id } (merge listing-data { active: false }))
                (ok true)
              )
          )
        )
    )
  )
)
