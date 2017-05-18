 //
// scrClearGlobals()
//
// Clear global variables.  Called once at start of run.
// See: oPlayer1:Animation End
//

/**********************************************************************************
    Copyright (c) 2008, 2009 Derek Yu and Mossmouth, LLC
    
    This file is part of Spelunky.

    You can redistribute and/or modify Spelunky, including its source code, under
    the terms of the Spelunky User License.

    Spelunky is distributed in the hope that it will be entertaining and useful,
    but WITHOUT WARRANTY.  Please see the Spelunky User License for more details.

    The Spelunky User License should be available in "Game Information", which
    can be found in the Resource Explorer, or as an external file called COPYING.
    If not, please obtain a new copy of Spelunky from <http://spelunkyworld.com/>
    
***********************************************************************************/

global.titleStart = 0;
global.ghostExists = false;

global.gameStart = false;
global.entityGen = false;

global.drawHUD = false;

global.collect = 0;
global.collectCounter = 0;

global.shake = 0;
global.shakeToggle = false;
global.yviewPrev = 0;
global.xview = 0;
global.yview = 0;

global.checkWater = false;
global.waterCounter = 0;

global.pickupItem = "";

global.crapsPoint = 0;

global.bloodLevel = 0;

global.noDarkLevel = true;

// probabilities
global.probDarkLevel = 12; // 12
global.probSnakePit = 8;   // 8
global.probCemetary = 10;  // 10
global.probLake = 10;      // 10
global.probYetiLair = 6;   // 6
global.probAlien = 10;     // 10
global.probSacPit = 8;     // 8

// player
global.thiefLevel = 0;
global.murderer = false;
global.favor = 0;
global.kaliGift = 0;
global.kaliPunish = 0;

global.madeUdjatEye = false;
global.genUdjatEye = false;
global.madeMarketEntrance = false;
global.genMarketEntrance = false;
global.marketChance = 160;
global.marketEntrance = false;
global.madeBlackMarket = false;
global.genBlackMarket = false;
global.madeMoai = false;
global.madeGoldEntrance = false;
global.genGoldEntrance = false;
global.goldChance = 160;
global.goldEntrance = false;
global.cityOfGold = false;

global.hasUdjatEye = false;
global.hasAnkh = false;
global.hasCrown = false;
global.hasKapala = false;
global.hasStickyBombs = false;
global.hasSpectacles = false;
global.hasCompass = false;
global.hasParachute = false;
global.hasSpringShoes = false;
global.hasSpikeShoes = false;
global.hasJordans = false;
global.hasNinjaSuit = false;
global.hasCape = false;
global.hasJetpack = false;
global.hasGloves = false;
global.hasMitt = false;
global.exitX = 0;
global.exitY = 0;

if (global.isTunnelMan)
{
    global.plife = 2;
    global.bombs = 0;
    global.rope = 0;
}
else
{
    global.plife = 4;
    global.bombs = 4;
    global.rope = 4;
}
global.flares = 3; // not used any more
global.arrows = 0;

global.money = 0;
global.time = 0;
global.kills = 0;
global.damsels = 0;

global.gold = 0;
global.goldbar = 0;
global.goldbars = 0;
global.nuggets = 0;
global.rubies = 0;
global.bigrubies = 0;
global.sapphires = 0;
global.bigsapphires = 0;
global.emeralds = 0;
global.bigemeralds = 0;
global.diamonds = 0;
global.scarabs = 0;
global.idols = 0;
global.skulls = 0;
global.xdamsels = 0;
global.xmoney = 0;
global.xtime = 0;

global.bats = 0;
global.snakes = 0;
global.spiders = 0;
global.skeletons = 0;
global.frogs = 0;
global.firefrogs = 0;
global.piranhas = 0;
global.mantraps = 0;
global.yetis = 0;
global.aliens = 0;
global.ufos = 0;
global.cavemen = 0;
global.hawkmen = 0;
global.monkeys = 0;
global.zombies = 0;
global.vampires = 0;
global.deadfish = 0;
global.alienbosses = 0;
global.giantspiders = 0;
global.yetikings = 0;
global.megamouths = 0;
global.tomblords = 0;
global.shopkeepers = 0;
global.damselsKilled = 0;

// cave
global.currLevel = 1;
global.levelType = 0;
