if (drawLoot == 0)
{
    if (drawPosX > 272)
    {
        drawPosX = 100;
        drawPosY += 2;
        if (drawPosY > 83 + 4) drawPosY = 83;
    }
}
else if (drawPosX > 232)
{
    drawPosX = 96;
    drawPosY += 2;
    if (drawPosY > 91 + 4) drawPosY = 91;
}

sprite = instance_create(drawPosX, drawPosY, oSprite);

if (drawLoot < 0)
{
    // nothing
}
else if (global.gold > 0)
{
    sprite.sprite_index = sGoldChunk;
    global.gold -= 1;
    isLoot = true;
}
else if (global.emeralds > 0)
{
    sprite.sprite_index = sEmerald;
    global.emeralds -= 1;
    isLoot = true;
}
else if (global.sapphires > 0)
{
    sprite.sprite_index = sSapphire;
    global.sapphires -= 1;
    isLoot = true;
}
else if (global.rubies > 0)
{
    sprite.sprite_index = sRuby;
    global.rubies -= 1;
    isLoot = true;
}
else if (global.nuggets > 0)
{
    sprite.sprite_index = sGoldNugget;
    global.nuggets -= 1;
    isLoot = true;
}
else if (global.goldbar > 0)
{
    sprite.sprite_index = sGoldBarDraw;
    global.goldbar -= 1;
    isLoot = true;
}
else if (global.goldbars > 0)
{
    sprite.sprite_index = sGoldBarsDraw;
    global.goldbars -= 1;
    isLoot = true;
}
else if (global.bigemeralds > 0)
{
    sprite.sprite_index = sEmeraldBig;
    global.bigemeralds -= 1;
    isLoot = true;
}
else if (global.bigsapphires > 0)
{
    sprite.sprite_index = sSapphireBig;
    global.bigsapphires -= 1;
    isLoot = true;
}
else if (global.bigrubies > 0)
{
    sprite.sprite_index = sRubyBig;
    global.bigrubies -= 1;
    isLoot = true;
}
else if (global.diamonds > 0)
{
    sprite.sprite_index = sDiamond;
    global.diamonds -= 1;
    isLoot = true;
}
else if (global.xdamsels > 0)
{
    if (global.isDamsel) sprite.sprite_index = sStandLeft;
    else sprite.sprite_index = sDamselLeft;
    global.xdamsels -= 1;
    isLoot = true;
}
else if (global.scarabs > 0)
{
    sprite.sprite_index = sScarabDisp;
    global.scarabs -= 1;
    isLoot = true;
}
else if (global.idols > 0)
{
    sprite.sprite_index = sGoldIdolIco;
    global.idols -= 1;
    isLoot = true;
}
else if (global.skulls > 0)
{
    sprite.sprite_index = sCrystalSkullIco;
    global.skulls -= 1;
    isLoot = true;
}
else
{
    if (drawLoot == 0)
    {
        drawPosX = 96;
        drawPosY = 91;
        sprite.x = 96;
        sprite.y = 91;
        drawLoot = 1;
    }
    
    if (global.bats > 0)
    {
        sprite.sprite_index = sBatLeft;
        global.bats -= 1;
        isKills = true;
    }
    else if (global.snakes > 0)
    {
        sprite.sprite_index = sSnakeLeft;
        global.snakes -= 1;
        isKills = true;
    }
    else if (global.spiders > 0)
    {
        sprite.sprite_index = sSpider;
        global.spiders -= 1;
        isKills = true;
    }
    else if (global.deadfish > 0)
    {
        sprite.sprite_index = sDeadFishLeftIco;
        global.deadfish -= 1;
        isKills = true;
    }
    else if (global.piranhas > 0)
    {
        sprite.sprite_index = sPiranhaLeftIco;
        global.piranhas -= 1;
        isKills = true;
    }
    else if (global.skeletons > 0)
    {
        sprite.sprite_index = sSkeletonLeft;
        global.skeletons -= 1;
        isKills = true;
    }
    else if (global.zombies > 0)
    {
        sprite.sprite_index = sZombieLeft;
        global.zombies -= 1;
        isKills = true;
    }
    else if (global.vampires > 0)
    {
        sprite.sprite_index = sVampireLeft;
        global.vampires -= 1;
        isKills = true;
    }
    else if (global.frogs > 0)
    {
        sprite.sprite_index = sFrogLeft;
        global.frogs -= 1;
        isKills = true;
    }
    else if (global.firefrogs > 0)
    {
        sprite.sprite_index = sFireFrogLeft;
        global.firefrogs -= 1;
        isKills = true;
    }
    else if (global.monkeys > 0)
    {
        sprite.sprite_index = sMonkeyLeft;
        global.monkeys -= 1;
        isKills = true;
    }
    else if (global.mantraps > 0)
    {
        sprite.sprite_index = sManTrapLeft;
        global.mantraps -= 1;
        isKills = true;
    }
    else if (global.yetis > 0)
    {
        sprite.sprite_index = sYetiLeft;
        global.yetis -= 1;
        isKills = true;
    }
    else if (global.ufos > 0)
    {
        sprite.sprite_index = sUFO;
        global.ufos -= 1;
        isKills = true;
    }
    else if (global.aliens > 0)
    {
        sprite.sprite_index = sAlien;
        global.aliens -= 1;
        isKills = true;
    }
    else if (global.alienbosses > 0)
    {
        sprite.sprite_index = sAlienBossDisp;
        global.alienbosses -= 1;
        isKills = true;
    }
    else if (global.cavemen > 0)
    {
        sprite.sprite_index = sCavemanLeft;
        global.cavemen -= 1;
        isKills = true;
    }
    else if (global.hawkmen > 0)
    {
        sprite.sprite_index = sHawkLeft;
        global.hawkmen -= 1;
        isKills = true;
    }
    else if (global.giantspiders > 0)
    {
        sprite.sprite_index = sGiantSpiderDisp;
        global.giantspiders -= 1;
        isKills = true;
    }
    else if (global.megamouths > 0)
    {
        sprite.sprite_index = sMegaMouth;
        global.megamouths -= 1;
        isKills = true;
    }
    else if (global.yetikings > 0)
    {
        sprite.sprite_index = sYetiKingDisp;
        global.yetikings -= 1;
        isKills = true;
    }
    else if (global.tomblords > 0)
    {
        sprite.sprite_index = sTombLordDisp;
        global.tomblords -= 1;
        isKills = true;
    }
    else if (global.damselsKilled > 0)
    {
        if (global.isDamsel) sprite.sprite_index = sStandLeftIco;
        else sprite.sprite_index = sDamselLeftIco;
        global.damselsKilled -= 1;
        isKills = true;
    }
    else if (global.shopkeepers > 0)
    {
        sprite.sprite_index = sShopLeftIco;
        global.shopkeepers -= 1;
        isKills = true;
    }
    else
    {
        drawLoot = 2;
        with sprite { instance_destroy(); }
    }
}

if (drawLoot < 0)
{
    // nothing
}
else if (drawLoot == 0)
    drawPosX += 4;
else
    drawPosX += 8;

if (drawLoot == 2)
{
    // nothing
}
else if (hurryup) alarm[0] = 1;
else alarm[0] = 3;

