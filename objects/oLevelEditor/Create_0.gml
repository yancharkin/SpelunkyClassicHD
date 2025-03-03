global.cleanSolids = true;
window_set_cursor(cr_none);
dropVal = 0;

GET_FILE_NAME = 0;
EDIT = 1;
INFO_NAME = 2;
INFO_AUTHOR = 3;
INFO_MUSIC = 4;
INFO_LIFE = 5;
INFO_BOMBS = 6;
INFO_ROPE = 7;
INFO_NEXT = 8;
EXIT = 9;
NEW = 10;
EDIT_DOOR = 11;
EDIT_MSG = 12;
status = 0;

levelName = "";
author = "ANONYMOUS";
music = "CAVE";
lifeStart = "4";
bombStart = "4";
ropeStart = "4";
nextLevel = tr("NONE");
textEdit = "";

for (j = 0; j < 32; j += 1)
{
    for (i = 0; i < 40; i += 1)
    {
        levelArray[i, j] = "0";
    }
}

BLOCKS = 0;
ENEMIES = 1;
TRAPS = 2;
ITEMS = 3;
dropSelect = 0;
if (global.tunnel1 == 0 and global.tunnel2 > 0) dropMax = 18;
else if (global.tunnel1 > 0 and global.tunnel2 == 0) dropMax = 21;
else if (global.tunnel1 == 0 and global.tunnel2 == 0) dropMax = 23;
else dropMax = 10;

// DEBUG
// dropMax = 23;

blockArray[0] = "@"; // Entrance
blockArray[1] = "X"; // Exit
blockArray[2] = "I"; // Sign
blockArray[3] = "1"; // Mines
blockArray[4] = "L"; // Ladder
blockArray[5] = "P"; // Ladder Platform
blockArray[6] = "B"; // Push Block
blockArray[7] = "&"; // Web
blockArray[8] = "r"; // Rock
blockArray[9] = "j"; // Jar
blockArray[10] = "k"; // Bones
blockArray[11] = "2"; // Jungle
blockArray[12] = "w"; // Water
blockArray[13] = "v"; // Vine
blockArray[14] = "t"; // Vine Top
blockArray[15] = "|"; // Tree Trunk
blockArray[16] = "x"; // Tree Top
blockArray[17] = ")"; // Tree Leaves
blockArray[18] = "q"; // Tree Branch
blockArray[19] = "3"; // Dark
blockArray[20] = "d"; // Dark Drop
blockArray[21] = "i"; // Ice
blockArray[22] = "4"; // Temple
blockArray[23] = "l"; // Lava

enemyArray[0] = "b"; // Bat
enemyArray[1] = "n"; // Snake
enemyArray[2] = "s"; // Spider
enemyArray[3] = "S"; // Giant Spider
enemyArray[4] = "K"; // Skeleton
enemyArray[5] = "h"; // Caveman
enemyArray[6] = "!"; // Shopkeeper
enemyArray[7] = "f"; // Frog
enemyArray[8] = "F"; // Fire Frog
enemyArray[9] = "z"; // Zombie
enemyArray[10] = "A"; // Vampire
enemyArray[11] = "M"; // Man Trap
enemyArray[12] = "m"; // Monkey
enemyArray[13] = "p"; // Piranha
enemyArray[14] = "{"; // Mega Mouth
enemyArray[15] = "a"; // Alien
enemyArray[16] = "U"; // UFO
enemyArray[17] = "E"; // Alien Boss
enemyArray[18] = "y"; // Yeti
enemyArray[19] = "Y"; // Yeti King
enemyArray[20] = "H"; // Hawkman
enemyArray[21] = "T"; // Tomb Lord

trapArray[0] = "^"; // Spikes
trapArray[1] = "<"; // Arrow Trap Left
trapArray[2] = ">"; // Arrow Trap Right
trapArray[3] = "]"; // Spear Trap Top
trapArray[4] = "["; // Spear Trap Bottom
trapArray[5] = "_"; // Spring Trap
trapArray[6] = "+"; // Smash Trap

lootArray[0] = "$"; // Gold Bar
lootArray[1] = "*"; // Gold Bars
lootArray[2] = "#"; // Gold Idol
lootArray[3] = "O"; // Crystal Skull
lootArray[4] = "5"; // Emerald
lootArray[5] = "6"; // Sapphire
lootArray[6] = "7"; // Ruby
lootArray[7] = "8"; // Diamond
lootArray[8] = "c"; // Chest
lootArray[9] = "C"; // Crate
lootArray[10] = "D"; // Damsel
lootArray[11] = "."; // Bomb Bag
lootArray[12] = ":"; // Bomb Box
lootArray[13] = "u"; // Paste
lootArray[14] = "R"; // Rope Pile
lootArray[15] = "`"; // Parachute
lootArray[16] = "o"; // Compass
lootArray[17] = "/"; // Machete
lootArray[18] = "~"; // Spring Shoes
lootArray[19] = "V"; // Spike Shoes
lootArray[20] = "}"; // Bow
lootArray[21] = "-"; // Pistol
lootArray[22] = "="; // Shotgun
lootArray[23] = "W"; // Web Cannon
lootArray[24] = "%"; // Spectacles
lootArray[25] = "G"; // Gloves
lootArray[26] = "g"; // Mitt
lootArray[27] = "?"; // Teleporter
lootArray[28] = "("; // Mattock
lootArray[29] = "\\"; // Cape
lootArray[30] = "J"; // Jetpack

if (global.testLevel != "")
{
    /*
    status = EDIT;
    levelName = global.testLevel;
    file = file_text_open_read(working_directory + "levels/" + string_lower(levelName)+".lvl");
    if (file)
    {
        for (j = 0; j < 32; j += 1)
        {
            str = file_text_read_string(file);
            for (i = 0; i < 40; i += 1)
            {
                levelArray[i, j] = string_char_at(str, i+1);
                scrCreateTile(levelArray[i, j], 16+i*16, 16+j*16);
            }
            file_text_readln(file);
        }
        author = file_text_read_string(file);
        file_text_readln(file);
        music = file_text_read_string(file);
        file_text_readln(file);
        lifeStart = file_text_read_string(file);
        file_text_readln(file);
        bombStart = file_text_read_string(file);
        file_text_readln(file);
        ropeStart = file_text_read_string(file);
        file_text_readln(file);
        nextLevel = file_text_read_string(file);
        file_text_close(file);
    }
    */
    
            status = EDIT;
            levelName = global.testLevel;
            file = file_text_open_read(working_directory + "levels/test.tmp");
            // file = file_text_open_read("levels/" + string_lower(levelName)+".lvl");
            if (file)
            {
                for (j = 0; j < 32; j += 1)
                {
                    str = file_text_read_string(file);
                    for (i = 0; i < 40; i += 1)
                    {
                        levelArray[i, j] = string_char_at(str, i+1);
                        //scrCreateTile(levelArray[i, j], 16+i*16, 16+j*16);
                    }
                    file_text_readln(file);
                }
                author = file_text_read_string(file);
                file_text_readln(file);
                music = file_text_read_string(file);
                file_text_readln(file);
                lifeStart = file_text_read_string(file);
                file_text_readln(file);
                bombStart = file_text_read_string(file);
                file_text_readln(file);
                ropeStart = file_text_read_string(file);
                file_text_readln(file);
                nextLevel = file_text_read_string(file);
                exitNamesNum = 0;
                if (not file_text_eof(file))
                {
                    file_text_readln(file);
                    exitNamesNum = real(file_text_read_string(file));
                }
                if (exitNamesNum > 0)
                {
                    file_text_readln(file);
                    for (i = 0; i < exitNamesNum; i += 1)
                    {
                        exitNames[i] = file_text_read_string(file);
                        if (i < exitNamesNum-1) file_text_readln(file);
                    }
                }
                signNamesNum = 0;
                if (not file_text_eof(file))
                {
                    file_text_readln(file);
                    signNamesNum = real(file_text_read_string(file));
                }
                if (signNamesNum > 0)
                {
                    file_text_readln(file);
                    for (i = 0; i < signNamesNum; i += 1)
                    {
                        signNames[i] = file_text_read_string(file);
          if (i < signNamesNum-1) file_text_readln(file);
                    }
                }
                file_text_close(file);
                
                // build level
                exitNamesID = 0;
                signNamesID = 0;
                for (j = 0; j < 32; j += 1)
                {
                    for (i = 0; i < 40; i += 1)
                    {
                        scrCreateTile(levelArray[i, j], 16+i*16, 16+j*16);
                        if (levelArray[i, j] == "X")
                        {
                            obj = instance_position(16+i*16, 16+j*16, oExit);
                            if (obj)
                            {
                                if (exitNamesNum > 0)
                                {
                                    obj.leadsTo = exitNames[exitNamesID];
                                    exitNamesID += 1;
                                }
                            }
                        }
                        else if (levelArray[i, j] == "@")
                        {
                            obj = instance_position(16+i*16, 16+j*16, oEntrance);
                            if (obj)
                            {
                                if (exitNamesNum > 0)
                                {
                                    obj.leadsTo = exitNames[exitNamesID];
                                    exitNamesID += 1;
                                }
                            }
                        }
                        else if (levelArray[i, j] == "I")
                        {
                            obj = instance_position(16+i*16, 16+j*16, oMsgSign);
                            if (obj)
                            {
                                if (signNamesNum > 0)
                                {
                                    obj.message = signNames[signNamesID];
                                    signNamesID += 1;
                                }
                            }
                        }
                    }
                }
            }

    window_set_cursor(cr_default);
    oCursObj.visible = true;
    instance_create(x, y, oEditButton);
    instance_create(x+320-32, y, oNewButton);
    instance_create(x+320-32, y, oTestButton);
}

/* */
/*  */
