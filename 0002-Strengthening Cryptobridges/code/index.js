// Example 4b - Generating a Transaction Hash from Transaction Data

const rlp = require("@ethereumjs/rlp");
const { keccak256 } = require("ethereum-cryptography/keccak");
const request = require("request");

// Helper to lookup an individual transaction
function recomputeTransactionHash(transactionHash) {
  request(
    "https://eth-mainnet.g.alchemy.com/v2/LJa5aFdztG0kWOcu_TSY-tAZ16RQoT4y",
    {
      method: "post",
      headers: { "Content-Type": "application/json" },
      body: `{"jsonrpc":"2.0","method":"eth_getTransactionByHash","params": ["${transactionHash}"],"id":1}`,
    },
    (_, response) => {
      const transaction = JSON.parse(response.body).result;
      //console.log("Transaction: ", transaction);
      const transactionData = [
        transaction.nonce,
        transaction.gasPrice,
        transaction.gas,
        transaction.to,
        transaction.value,
        transaction.input,
        transaction.v,
        transaction.r,
        transaction.s,
      ];

      console.log("Transaction data: ", transactionData);
      console.log(
        "Transaction hash: ",
        Buffer.from(keccak256(rlp.encode(transactionData)))
      );
      console.log(
        "Transaction hash: ",
        Buffer.from(rlp.encode(transactionData)).toString("hex")
      );
      const txHash =
        "0x" +
        Buffer.from(keccak256(rlp.encode(transactionData))).toString("hex");

      if (txHash == transactionHash) {
        console.log("------------------------------------------");
        console.log("Transaction hash is correct");
        console.log(txHash);
        console.log("------------------------------------------");
      } else {
        console.log("------------------------------------------");
        console.log("Transaction hash is incorrect");
        console.log("Result by script: ");
        console.log(txHash);
        console.log("Original result: ");
        console.log(transactionHash);
        console.log("------------------------------------------");
      }
    }
  );
}

function recomputeBlockHash(number) {
  const numberHex = "0x" + Number(number).toString(16);

  request(
    "https://eth-mainnet.g.alchemy.com/v2/LJa5aFdztG0kWOcu_TSY-tAZ16RQoT4y",
    {
      method: "post",
      headers: { "Content-Type": "application/json" },
      body: `{"jsonrpc":"2.0","method":"eth_getBlockByNumber","params": ["${numberHex}",true],"id":1}`,
    },
    (_, response) => {
      const transaction = JSON.parse(response.body).result;
      //console.log("Block data: ", transaction);
      const transactionData = [
        transaction.parentHash,
        transaction.sha3Uncles,
        transaction.miner,
        transaction.stateRoot,
        transaction.transactionsRoot,
        transaction.receiptsRoot,
        transaction.logsBloom,
        transaction.difficulty,
        transaction.number,
        transaction.gasLimit,
        "0x", //transaction.gasUsed,
        transaction.timestamp,
        transaction.extraData,
        transaction.mixHash,
        transaction.nonce,
      ];
      console.log("Block data: ", transactionData);

      console.log(
        "Block hash: ",
        Buffer.from(keccak256(rlp.encode(transactionData)))
      );
      console.log(
        "Block hash: ",
        Buffer.from(rlp.encode(transactionData)).toString("hex")
      );
      const txHash =
        "0x" +
        Buffer.from(keccak256(rlp.encode(transactionData))).toString("hex");
      if (txHash == transaction.hash) {
        console.log("------------------------------------------");
        console.log("Block hash is correct");
        console.log(txHash);
        console.log("------------------------------------------");
      } else {
        console.log("------------------------------------------");
        console.log("Block hash is incorrect");
        console.log("Result by script: ");
        console.log(txHash);
        console.log("Original result: ");
        console.log(transaction.hash);
        console.log("------------------------------------------");
      }
    }
  );
}


function recomputeTransactionHash(transactionHash) {
  request(
    "https://eth-mainnet.g.alchemy.com/v2/LJa5aFdztG0kWOcu_TSY-tAZ16RQoT4y",
    {
      method: "post",
      headers: { "Content-Type": "application/json" },
      body: `{"jsonrpc":"2.0","method":"eth_getTransactionByHash","params": ["${transactionHash}"],"id":1}`,
    },
    (_, response) => {
      const transaction = JSON.parse(response.body).result;
      //console.log("Transaction: ", transaction);
      const transactionData = [
        transaction.nonce,
        transaction.gasPrice,
        transaction.gas,
        transaction.to,
        transaction.value,
        transaction.input,
        transaction.v,
        transaction.r,
        transaction.s,
      ];

      console.log("Transaction data: ", transactionData);
      console.log(
        "Transaction hash: ",
        Buffer.from(keccak256(rlp.encode(transactionData)))
      );
      console.log(
        "Transaction hash: ",
        Buffer.from(rlp.encode(transactionData)).toString("hex")
      );
      const txHash =
        "0x" +
        Buffer.from(keccak256(rlp.encode(transactionData))).toString("hex");

      if (txHash == transactionHash) {
        console.log("------------------------------------------");
        console.log("Transaction hash is correct");
        console.log(txHash);
        console.log("------------------------------------------");
      } else {
        console.log("------------------------------------------");
        console.log("Transaction hash is incorrect");
        console.log("Result by script: ");
        console.log(txHash);
        console.log("Original result: ");
        console.log(transactionHash);
        console.log("------------------------------------------");
      }
    }
  );
}

function recomputeBlockHashPostEIP3675(number) {
  const numberHex = "0x" + Number(number).toString(16);

  request(
    "https://eth-mainnet.g.alchemy.com/v2/zgMiCv4ZGzSh3qut1mtzcbuqBDbos_e6",
    {
      method: "post",
      headers: { "Content-Type": "application/json" },
      body: `{"jsonrpc":"2.0","method":"eth_getBlockByNumber","params": ["${numberHex}",true],"id":0}`,
    },
    (_, response) => {
      const transaction = JSON.parse(response.body).result;
      //console.log("Block data: ", transaction);
      const transactionData = [
        transaction.parentHash,
        '0x1dcc4de8dec75d7aab85b567b6ccd41ad312451b948a7413f0a142fd40d49347', // sha3Uncles (constant)
        transaction.miner,
        transaction.stateRoot,
        transaction.transactionsRoot,
        transaction.receiptsRoot,
        transaction.logsBloom,
         // difficulty (constant)
        transaction.number,
        transaction.gasLimit,
        transaction.gasUsed,
        transaction.timestamp,
        transaction.extraData,
        '0x0000000000000000000000000000000000000000000000000000000000000000', // mixHash (constant)
        '0x0000000000000000', // nonce (constant)
        transaction.baseFeePerGas
      ];
      console.log("Block data: ", transactionData);

      console.log(
        "Block hash: ",
        Buffer.from(keccak256(rlp.encode(transactionData)))
      );
      console.log(
        "Block hash: ",
        Buffer.from(rlp.encode(transactionData)).toString("hex")
      );
      const txHash =
        "0x" +
        Buffer.from(keccak256(rlp.encode(transactionData))).toString("hex");
      if (txHash == transaction.hash) {
        console.log("------------------------------------------");
        console.log("Block hash is correct");
        console.log(txHash);
        console.log("------------------------------------------");
      } else {
        console.log("------------------------------------------");
        console.log("Block hash is incorrect");
        console.log("Result by script: ");
        console.log(txHash);
        console.log("Original result: ");
        console.log(transaction.hash);
        console.log("------------------------------------------");
      }
    }
  );
}

//main async function
async function main() {
  //does not has input
  /*recomputeTransactionHash(
    "0x39fbe5446a0be5cbf62c2b623b33bc3a93cf9ec04439218c45b5eafdea736de2"
  );*/
  //has input
  /*recomputeBlockHashPostEIP3675(
    "0x36855e78a4056dee5eee89ab8b56e89df27135195d23ed96b532f8bb8db99e78"
  );*/
  //recomputeBlockHash("0x61A80");
  recomputeBlockHashPostEIP3675("0x120733B");
}

main();
