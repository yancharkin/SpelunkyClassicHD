if (isRoom("rTutorial"))
{
    // do nothing
}
else if (global.snakePit)
{
    global.message = tr("I HEAR SNAKES... I HATE SNAKES!");
    global.message2 = "";
    global.messageTimer = 200;
}
else if (global.cemetary and global.darkLevel)
{
    global.message = tr("THE DEAD ARE RESTLESS!");
    global.message2 = "";
    global.messageTimer = 200;
    if (global.lake) alarm[4] = 210;
}
else if (global.lake)
{
    global.message = tr("I CAN HEAR RUSHING WATER...");
    global.message2 = "";
    global.messageTimer = 200;
}
else if (global.yetiLair)
{
    global.message = tr("IT SMELLS LIKE WET FUR IN HERE!");
    global.message2 = "";
    global.messageTimer = 200;
}
else if (global.alienCraft)
{
    global.message = tr("THERE'S A PSYCHIC PRESENCE HERE!");
    global.message2 = "";
    global.messageTimer = 200;
}
else if (global.cityOfGold)
{
    global.message = tr("IT'S THE LEGENDARY CITY OF GOLD!");
    global.message2 = "";
    global.messageTimer = 200;
    if (global.sacrificePit) alarm[4] = 210;
}
else if (global.sacrificePit)
{
    global.message = tr("I CAN HEAR PRAYERS TO KALI!");
    global.message2 = "";
    global.messageTimer = 200;
}
