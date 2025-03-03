action_inherited();
if (breakPieces)
{
    playSound(global.sndBreak);
    instance_create(x, y, oSmokePuff)
    for (i = 0; i < rand(1,2); i += 1)
    {
        piece = instance_create(x-2, y-2, oBone);
        if (colLeft) piece.xVel = rand(1,3);
        else if (colRight) piece.xVel = -rand(1,3);
        else piece.xVel = rand(1,3)-rand(1,3);
        if (colTop) piece.yVel = rand(0,3);
        else piece.yVel = -rand(0,3);
    }
    if (held)
    {
        oPlayer1.holdItem = 0;
        oPlayer1.pickupItem = "";
    }
}
