action_inherited();
if isCollisionCharacterTop(1,0)
{
    timeFall -= 1
    if (timeFall <= 0) yAcc = grav;
}
else if (timeFall < timeFallMax) timeFall += 1;

if (yVel > 10) yVel = 10;

