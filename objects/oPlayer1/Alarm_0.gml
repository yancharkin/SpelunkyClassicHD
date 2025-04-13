if (isRoom("rTutorial"))
{
    // do nothing
}
else if (global.darkLevel)
{
    if (global.hasCrown) message1 = "THE HEDJET SHINES BRIGHTLY.";
    else message1 = "I CAN'T SEE A THING!";
    if (global.hasCrown)message2 = "";
    else message2 = "I'D BETTER USE THESE FLARES!";
    alarm[1] = 210;
}
else if (global.blackMarket)
{
    message1 = "WELCOME TO THE BLACK MARKET!";
    message2 = "";
    alarm[1] = 210;
}
else if (global.snakePit)
{
    message1 = "I HEAR SNAKES... I HATE SNAKES!";
    message2 = "";
}
else if (global.cemetary)
{
    message1 = "THE DEAD ARE RESTLESS!";
    message2 = "";
    if (global.lake) alarm[1] = 210;
}
else if (global.lake)
{
    message1 = "I CAN HEAR RUSHING WATER...";
    message2 = "";
}
else if (global.yetiLair)
{
    message1 = "IT SMELLS LIKE WET FUR IN HERE!";
    message2 = "";
}
else if (global.alienCraft)
{
    message1 = "THERE'S A PSYCHIC PRESENCE HERE!";
    message2 = "";
}
else if (global.cityOfGold)
{
    message1 = "IT'S THE LEGENDARY CITY OF GOLD!";
	message2 = "";
    if (global.sacrificePit) alarm[1] = 210;
}
else if (global.sacrificePit)
{
    message1 = "I CAN HEAR PRAYERS TO KALI!";
    message2 = "";
}
trMessages(message1, message2, 0, 0, 200);