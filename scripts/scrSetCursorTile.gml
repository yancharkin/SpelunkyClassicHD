//
// scrSetCursorTile
//
// Set cursor sprite.  Called by oLevelEditor.
//

if (dropSelect == BLOCKS)
{
    if (blockArray[dropVal] == "@") oCursObj.sprite_index = sEntrance;
    if (blockArray[dropVal] == "X") oCursObj.sprite_index = sExit;
    if (blockArray[dropVal] == "I") oCursObj.sprite_index = sMsgSign;
    if (blockArray[dropVal] == "1") oCursObj.sprite_index = sBrick;
    if (blockArray[dropVal] == "2") oCursObj.sprite_index = sLush;
    if (blockArray[dropVal] == "w") oCursObj.sprite_index = sWater;
    if (blockArray[dropVal] == "3") oCursObj.sprite_index = sDark;
    if (blockArray[dropVal] == "i") oCursObj.sprite_index = sIce;
    if (blockArray[dropVal] == "d") oCursObj.sprite_index = sDarkFall;
    if (blockArray[dropVal] == "4") oCursObj.sprite_index = sTemple;
    if (blockArray[dropVal] == "l") oCursObj.sprite_index = sLava;
    if (blockArray[dropVal] == "L") oCursObj.sprite_index = sLadder;
    if (blockArray[dropVal] == "P") oCursObj.sprite_index = sLadderTop;
    if (blockArray[dropVal] == "v") oCursObj.sprite_index = sVine;
    if (blockArray[dropVal] == "t") oCursObj.sprite_index = sVineTop;
    if (blockArray[dropVal] == "|") oCursObj.sprite_index = sTreeTrunk;
    if (blockArray[dropVal] == "x") oCursObj.sprite_index = sTreeTop;
    if (blockArray[dropVal] == ")") oCursObj.sprite_index = sLeaves;
    if (blockArray[dropVal] == "q") oCursObj.sprite_index = sTreeBranchLeft;
    if (blockArray[dropVal] == "B") oCursObj.sprite_index = sBlock;
    if (blockArray[dropVal] == "&") oCursObj.sprite_index = sWeb;
    if (blockArray[dropVal] == "r") oCursObj.sprite_index = sRockTile;
    if (blockArray[dropVal] == "j") oCursObj.sprite_index = sJarTile;
    if (blockArray[dropVal] == "k") oCursObj.sprite_index = sFakeBonesLeft;
}
else if (dropSelect == ENEMIES)
{
    if (enemyArray[dropVal] == "b") oCursObj.sprite_index = sBatLeft;
    if (enemyArray[dropVal] == "n") oCursObj.sprite_index = sSnakeLeft;
    if (enemyArray[dropVal] == "s") oCursObj.sprite_index = sSpider;
    if (enemyArray[dropVal] == "S") oCursObj.sprite_index = sGiantSpiderHang;
    if (enemyArray[dropVal] == "K") oCursObj.sprite_index = sSkeletonLeft;
    if (enemyArray[dropVal] == "h") oCursObj.sprite_index = sCavemanLeft;
    if (enemyArray[dropVal] == "!") oCursObj.sprite_index = sShopLeftIco;
    if (enemyArray[dropVal] == "f") oCursObj.sprite_index = sFrogLeft;
    if (enemyArray[dropVal] == "F") oCursObj.sprite_index = sFireFrogLeft;
    if (enemyArray[dropVal] == "z") oCursObj.sprite_index = sZombieLeft;
    if (enemyArray[dropVal] == "A") oCursObj.sprite_index = sVampireLeft;
    if (enemyArray[dropVal] == "p") oCursObj.sprite_index = sPiranhaTile;
    if (enemyArray[dropVal] == "M") oCursObj.sprite_index = sManTrapLeft;
    if (enemyArray[dropVal] == "m") oCursObj.sprite_index = sMonkeyLeft;
    if (enemyArray[dropVal] == "y") oCursObj.sprite_index = sYetiLeft;
    if (enemyArray[dropVal] == "a") oCursObj.sprite_index = sAlien;
    if (enemyArray[dropVal] == "U") oCursObj.sprite_index = sUFO;
    if (enemyArray[dropVal] == "E") oCursObj.sprite_index = sAlienBoss;
    if (enemyArray[dropVal] == "H") oCursObj.sprite_index = sHawkLeft;
    if (enemyArray[dropVal] == "Y") oCursObj.sprite_index = sYetiKingLeft;
    if (enemyArray[dropVal] == "{") oCursObj.sprite_index = sMegaMouthTile;
    if (enemyArray[dropVal] == "T") oCursObj.sprite_index = sTombLordLeft;
}
else if (dropSelect == TRAPS)
{
    if (trapArray[dropVal] == "^") oCursObj.sprite_index = sSpikes;
    if (trapArray[dropVal] == "<") oCursObj.sprite_index = sArrowTrapLeft;
    if (trapArray[dropVal] == ">") oCursObj.sprite_index = sArrowTrapRight;
    if (trapArray[dropVal] == "]") oCursObj.sprite_index = sSpearTrap1;
    if (trapArray[dropVal] == "[") oCursObj.sprite_index = sSpearTrap2;
    if (trapArray[dropVal] == "_") oCursObj.sprite_index = sSpringTrap;
    if (trapArray[dropVal] == "+") oCursObj.sprite_index = sSmashTrap;
}
else if (dropSelect == ITEMS)
{
    if (lootArray[dropVal] == "$") oCursObj.sprite_index = sGoldBarTile;
    if (lootArray[dropVal] == "*") oCursObj.sprite_index = sGoldBarsTile;
    if (lootArray[dropVal] == "#") oCursObj.sprite_index = sGoldIdolTile;
    if (lootArray[dropVal] == "O") oCursObj.sprite_index = sCrystalSkullTile;
    if (lootArray[dropVal] == "5") oCursObj.sprite_index = sEmeraldBigTile;
    if (lootArray[dropVal] == "6") oCursObj.sprite_index = sSapphireBigTile;
    if (lootArray[dropVal] == "7") oCursObj.sprite_index = sRubyBigTile;
    if (lootArray[dropVal] == "8") oCursObj.sprite_index = sDiamondTile;
    if (lootArray[dropVal] == "c") oCursObj.sprite_index = sChestTile;
    if (lootArray[dropVal] == "C") oCursObj.sprite_index = sCrateTile;
    if (lootArray[dropVal] == "D") oCursObj.sprite_index = sDamselLeftIco;
    if (lootArray[dropVal] == ".") oCursObj.sprite_index = sBombBagTile;
    if (lootArray[dropVal] == ":") oCursObj.sprite_index = sBombBoxTile;
    if (lootArray[dropVal] == "u") oCursObj.sprite_index = sBombPasteTile;
    if (lootArray[dropVal] == "R") oCursObj.sprite_index = sRopePileTile;
    if (lootArray[dropVal] == "`") oCursObj.sprite_index = sParachuteTile;
    if (lootArray[dropVal] == "o") oCursObj.sprite_index = sCompassTile;
    if (lootArray[dropVal] == "/") oCursObj.sprite_index = sMacheteTile;
    if (lootArray[dropVal] == "~") oCursObj.sprite_index = sSpringShoesTile;
    if (lootArray[dropVal] == "V") oCursObj.sprite_index = sSpikeShoesTile;
    if (lootArray[dropVal] == "}") oCursObj.sprite_index = sBowTile;
    if (lootArray[dropVal] == "-") oCursObj.sprite_index = sPistolTile;
    if (lootArray[dropVal] == "=") oCursObj.sprite_index = sShotgunTile;
    if (lootArray[dropVal] == "W") oCursObj.sprite_index = sWebCannonTile;
    if (lootArray[dropVal] == "%") oCursObj.sprite_index = sSpectaclesTile;
    if (lootArray[dropVal] == "G") oCursObj.sprite_index = sGlovesTile;
    if (lootArray[dropVal] == "g") oCursObj.sprite_index = sMittTile;
    if (lootArray[dropVal] == "?") oCursObj.sprite_index = sTeleporterTile;
    if (lootArray[dropVal] == "(") oCursObj.sprite_index = sMattockTile;
    if (lootArray[dropVal] == "\") oCursObj.sprite_index = sCapeTile;
    if (lootArray[dropVal] == "J") oCursObj.sprite_index = sJetpackTile;
}
