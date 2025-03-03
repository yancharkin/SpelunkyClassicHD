if (sprite_index == sTombLordTurnR)
{
    facing = RIGHT;
    status = WALK;
}
if (sprite_index == sTombLordTurnL)
{
    facing = LEFT;
    status = WALK;
}
if (sprite_index == sTombLordAttackL or sprite_index == sTombLordAttackR)
{
    status = IDLE;
    counter = 30;
    image_speed = 0.25;
}
