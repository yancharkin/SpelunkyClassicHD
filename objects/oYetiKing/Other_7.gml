if (sprite_index == sYetiKingTurnR)
{
    facing = RIGHT;
    status = WALK;
}
if (sprite_index == sYetiKingTurnL)
{
    facing = LEFT;
    status = WALK;
}
if (sprite_index == sYetiKingYellL or sprite_index == sYetiKingYellR)
{
    status = IDLE;
    counter = 30;
    image_speed = 0.25;
}
