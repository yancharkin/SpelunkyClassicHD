y += yVel;
if (yVel > -6) yVel += yAcc;

if (collision_point(x, y-1, oEndPlat, 0, 0))
{
    oEndPlat.yVel = yVel;
    oPDummy.yVel = yVel;
    oBigTreasure.yVel = yVel;
    oBigTreasure.myGrav = 0;
}

if (y < -16 and status == 0)
{
    yVel = 0;
    yAcc = 0;
    alarm[0] = 40;
    status += 1;
}

if (not SS_IsSoundPlaying(global.sndFlame)) playSound(global.sndFlame);
