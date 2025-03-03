action_inherited();
cleanDeath = false;

n = rand(1,100);

if (n < 20) sprite_index = sLushGold;
else if (n < 30) sprite_index = sLushGoldBig;
else if (isLevel() and x > 1 and x < room_width-16 and y > 1 and y < room_height-16)
{
    if (rand(1,80) == 1) instance_create(x+8, y+8, oSapphireBig);
    else if (rand(1,100) == 1) instance_create(x+8, y+8, oEmeraldBig);
    else if (rand(1,120) == 1) instance_create(x+8, y+8, oRubyBig);
    else if (rand(1,1200) == 1) scrGenerateItem(x+8, y+8, 2);
}
