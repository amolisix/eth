// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;


import {LibDiamond} from "../vendor/libraries/LibDiamond.sol";
// Storage imports
import {WithStorage} from "../libraries/LibStorage.sol";

// Type imports
import {
    SpaceType,
    Planet,
    PlanetExtendedInfo,
    PlanetExtendedInfo2,
    Player,
    ArtifactType,
    DFPInitPlanetArgs,
    DFPMoveArgs,
    DFPFindArtifactArgs,
    AdminCreatePlanetArgs
} from "../DFTypes.sol";

contract DFUniverseManageFacet is WithStorage{

    event PlantRarityChanged(uint256 newPlantRarity);

    modifier notPaused() {
        require(!gs().paused, "Game is paused");
        _;
    }

    modifier onlyAdmin() {
        LibDiamond.enforceIsContractOwner();
        _;
    }

    function setPlantRarity(uint256 NewPlantRarity) public notPaused onlyAdmin returns (bool){
        require(NewPlantRarity > 100,"Plant rarity need to be bigger then 100");
        gameConstants().PLANET_RARITY = NewPlantRarity;
        emit PlantRarityChanged(NewPlantRarity);

        return true;
    }

}