playSound(global.sndHit);
playSound(global.sndCoin);
oMoonRoom.baskets += difficulty;

with other { instance_destroy(); }

instance_create(xMid, -64, oBatTarget);

if (sprite_index = sUFO) instance_create(x, y, oUFOCrash);
else scrCreateBlood(x+8, y+8, 3);
instance_destroy();
