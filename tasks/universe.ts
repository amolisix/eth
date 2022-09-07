import { task, types } from 'hardhat/config';
import { HardhatRuntimeEnvironment } from 'hardhat/types';
// @ts-ignore

task('universe:setPlanetRarity', 'set the plant rarity')
  .addParam('planetRarity','new plant rarity number', undefined, types.int)
  .setAction(setPlanetRarity);

async function setPlanetRarity({ planetRarity }: { planetRarity: number }, hre: HardhatRuntimeEnvironment) {
  await hre.run('utils:assertChainId');

  const contract = await hre.ethers.getContractAt('DarkForest', hre.contracts.CONTRACT_ADDRESS);

  const setPlanetRarityReciept = await contract.setPlantRarity(planetRarity);
  await setPlanetRarityReciept.wait();
}