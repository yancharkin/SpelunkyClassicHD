//yVel += yAcc;
//if (yVel < 4) yVel = 4;
x += xVel;
y += yVel;

if (status == 0)
{
    if (x < __view_get( e__VW.XView, 0 ) + 320 + 16)
    {
        status = 1;
        xVel = -random(3)-2;
        yVel = -random(1);
        yAcc = -random(1)*0.2;
        playSound(global.sndBat);
    }
}
