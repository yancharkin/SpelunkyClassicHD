if (rand(1,2) == 1) instance_create(x+rand(0,16), y+rand(0,16), oFlameTrail);
else instance_create(x+rand(0,16), y+rand(0,16), oBurn);
alarm[0] = 3;
