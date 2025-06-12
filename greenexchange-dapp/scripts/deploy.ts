import { Clarinet, Tx, Chain } from "https://deno.land/x/clarinet/index.ts";

Clarinet.test({
  name: "Deploy contract",
  async fn(chain: Chain, accounts: Map<string, string>) {
    let deployer = accounts.get("deployer")!;
    // You can write initial tests or use Clarinet CLI to deploy
  }
});