playSound(global.sndBreak);
instance_create(x, y, oSmokePuff)
for (i = 0; i < 3; i += 1)
{
    piece = instance_create(x-2, y-2, oRubbleSmall);
    piece.xVel = rand(1,3)-rand(1,3);
}
    
if (rand(1,3) == 1) instance_create(x, y, oGoldChunk);
else if (rand(1,6) == 1) instance_create(x, y, oGoldNugget);
else if (rand(1,12) == 1) instance_create(x, y, oEmeraldBig);
else if (rand(1,12) == 1) instance_create(x, y, oSapphireBig);
else if (rand(1,12) == 1) instance_create(x, y, oRubyBig);
else if (rand(1,6) == 1) instance_create(x-8, y-8, oSpider);
else if (rand(1,12) == 1) instance_create(x-8, y-8, oSnake);
if (held)
{
    oPlayer1.holdItem = 0;
    oPlayer1.pickupItemType = "";
}
instance_destroy();
