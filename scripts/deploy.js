  const main = async () => {

    const Todolist = await hre.ethers.getContractFactory("Todolist");
    const todo = await Todolist.deploy();

    await todo.deployed();

    console.log("Todolist address:", todo.address);
  };

  const runMain = async () => {
    try {
      await main();
      process.exit(0);
    } catch (error){
      console.error(error);
      process.exit(1);
    }
  };

  runMain();

