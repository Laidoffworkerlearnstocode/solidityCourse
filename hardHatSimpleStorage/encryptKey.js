const ethers = require('ethers');
const fs = require('fs-extra');
const colors = require('colors');
require('dotenv').config();

async function main() {
    const wallet = new ethers.Wallet(process.env.PRIVATE_KEY);
    const encryptedKeyStore = await wallet.encrypt(process.env.PASSWORD, process.env.PRIVATE_KEY);
    console.log(`加密后的keystore: ${encryptedKeyStore}`.green);
    await fs.writeFile("./keystoreSepolia.json", encryptedKeyStore);
    console.log(`已经保存到本地`.blue);
}

main()
    .then(() => process.exit(0))
    .catch(error => {
        console.error(error);
        process.exit(1);
    }
);