if (status == EATING)
{
    sprite_index = sManTrapSleepL;
    status = SLEEPY;
}
else if (sprite_index == sManTrapSleepL)
{
    sprite_index = sManTrapStunL;
    status = STUNNED;
    counter = stunTime*2;
}

