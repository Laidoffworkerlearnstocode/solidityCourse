const ethers = require('ethers');
const fs = require('fs-extra');
const colors = require('colors');

require('dotenv').config();

async function main() {
    // ganache RPC Listening on 127.0.0.1:8545
    const provider = new ethers.providers.JsonRpcProvider('http://127.0.0.1:8545');
    console.log(`已经连接到ganache: ${provider.connection.url}`);
    const wallet = new ethers.Wallet(process.env.PRIVATE_KEY, provider);
    console.log(`已经使用钱包: ${wallet.address}连接到ganache`);
    const abi = await fs.readFile("./SimpleStorage_sol_SimpleStorage.abi", "utf-8");
    const binary = await fs.readFile("./SimpleStorage_sol_SimpleStorage.bin", "utf-8");
    const contractFactory = new ethers.ContractFactory(abi, binary, wallet);
    console.log(`正在部署合约...`);
    const contract = await contractFactory.deploy();
    console.log(`合约部署成功: ${contract.address}`);
    const receipt = await contract.deployTransaction.wait(1);
    console.log(`合约部署交易的哈希: ${receipt.transactionHash}`);

    const currentFavoriteNumber = await contract.retrieve();
    console.log(`当前的favoriteNumber: ${currentFavoriteNumber}`.blue);
    const tx = await contract.store(13);
    const receipt_1 = await tx.wait(1);
    console.log(`store交易的哈希: ${receipt_1.transactionHash}`);
    const newFavoriteNumber = await contract.retrieve();
    console.log(`新的favoriteNumber: ${newFavoriteNumber}`.green);
}

main()
    .then(() => process.exit(0))
    .catch(error => {
        console.error(error);
        process.exit(1);
    }
);