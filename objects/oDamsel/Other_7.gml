if (status == YELL)
{
    status = IDLE;
    counter = 200;
}

if (status == KISS)
{
    status = SLAVE;
}

if (sprite_index == sDamselExit2 or sprite_index = sPExit)
{
    instance_destroy();
}
