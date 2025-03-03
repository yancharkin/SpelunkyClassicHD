oBigChest.sprite_index = sBigChestOpen;
treasure = instance_create(oBigChest.x, oBigChest.y, oBigTreasure);
treasure.yVel = -4;
treasure.xVel = -3;
playSound(global.sndClick);
alarm[2] = 20;
