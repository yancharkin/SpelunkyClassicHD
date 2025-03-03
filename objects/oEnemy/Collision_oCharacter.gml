// jumped on - oCaveman, oManTrap replaces this script with its own
if (abs(other.x-(x+8)) > 12)
{
    // do nothing
}
else if (not other.dead and (other.state == 15 or other.state == 16) and other.y < y+8 and not other.swimming)
{
    other.yVel = -6 - 0.2 * other.yVel;
    if (global.hasSpikeShoes) { hp -= (3 * (floor(other.fallTimer/16)+1)); scrCreateBlood(other.x, other.y+8, 1); }
    else hp -= (1 * (floor(other.fallTimer/16)+1));
    other.fallTimer = 0;
    playSound(global.sndHit);
}
else if (other.invincible == 0)
{
    other.blink = 30;
    other.invincible = 30;
    if (other.x < x)
        other.xVel = -6;
    else
        other.xVel = 6;
    
    if (global.plife > 0)
    {
        global.plife -= 1;
        
        if (global.plife <= 0 and isRealLevel())
        {
            if (type == "Bat") global.enemyDeaths[0] += 1;
            else if (type == "Snake") global.enemyDeaths[1] += 1;
            else if (type == "Spider") global.enemyDeaths[2] += 1;
            else if (type == "Giant Spider") global.enemyDeaths[3] += 1;
            else if (type == "Caveman") global.enemyDeaths[4] += 1;
            else if (type == "Skeleton") global.enemyDeaths[5] += 1;
            else if (type == "Zombie") global.enemyDeaths[6] += 1;
            else if (type == "Vampire") global.enemyDeaths[7] += 1;
            else if (type == "Frog") global.enemyDeaths[8] += 1;
            else if (type == "Fire Frog") global.enemyDeaths[9] += 1;
            else if (type == "Mantrap") global.enemyDeaths[10] += 1;
            else if (type == "Piranha") global.enemyDeaths[11] += 1;
            else if (type == "Megamouth") global.enemyDeaths[12] += 1;
            else if (type == "Yeti") global.enemyDeaths[13] += 1;
            else if (type == "Yeti King") global.enemyDeaths[14] += 1;
            else if (type == "Alien") global.enemyDeaths[15] += 1;
            else if (type == "UFO") global.enemyDeaths[16] += 1;
            else if (type == "Alien Boss") global.enemyDeaths[17] += 1;
            else if (type == "Hawkman") global.enemyDeaths[18] += 1;
            else if (type == "Shopkeeper") global.enemyDeaths[19] += 1;
            else if (type == "Tomb Lord") global.enemyDeaths[20] += 1;
            else if (type == "Magma Man") global.enemyDeaths[21] += 1;
            else if (type == "Olmec") global.enemyDeaths[22] += 1;
        }
    }
       
    if (type == "Bat" || type == "Piranha" || type == "Vampire") scrCreateBlood(x+4, y+4, 1);
    
    playSound(global.sndHurt);
}

