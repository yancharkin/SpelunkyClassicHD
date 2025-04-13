if (isRoom("rTutorial"))
{
    // do nothing
}
else if (global.snakePit)
{
    message1 = "I HEAR SNAKES... I HATE SNAKES!";
    message2 = "";
}
else if (global.cemetary and global.darkLevel)
{
    message1 = "THE DEAD ARE RESTLESS!";
    message2 = "";
    if (global.lake) alarm[4] = 210;
}
else if (global.lake)
{
    message1 = "I CAN HEAR RUSHING WATER...";
    message2 = "";
}
else if (global.yetiLair)
{
    message1 = "THERE'S A PSYCHIC PRESENCE HERE!";
    message2 = "";
}
else if (global.alienCraft)
{
    message1 = "IT'S THE LEGENDARY CITY OF GOLD!";
	message2 = "";
}
else if (global.cityOfGold)
{
    message1 = "IT'S THE LEGENDARY CITY OF GOLD!";
	message2 = "";
    if (global.sacrificePit) alarm[4] = 210;
}
else if (global.sacrificePit)
{
    message1 = "I CAN HEAR PRAYERS TO KALI!";
    message2 = "";
}
trMessages(message1, message2, 0, 0, 200);