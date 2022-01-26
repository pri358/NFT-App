const main = async () => {
    // compile the contract
    // hre: hardhat runtime environment, provided by hardhat everytime we compile
    const nftContractFactory = await hre.ethers.getContractFactory('MyEpicNFT');
    // deploy a local blockchain just for this contract that gets deleted at the end of the script
    const nftContract = await nftContractFactory.deploy();
    await nftContract.deployed();
    console.log("Contract deployed to: ", nftContract.address);

    // call the function
    let txn = await nftContract.makeAnEpicNFT();
    await txn.wait();

    // mint another one 
    txn = await nftContract.makeAnEpicNFT();
    await txn.wait();

    txn = await nftContract.makeAnEpicNFT();
    await txn.wait();
};

const runMain = async () => {
    try {
        await main();
        process.exit(0);
    } 
    catch (error) {
        console.log(error);
        process.exit(1);
    }
};

runMain();