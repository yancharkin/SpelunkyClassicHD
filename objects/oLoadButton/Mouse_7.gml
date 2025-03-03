if (sprite_index == sLoadButtonPressed and active)
{
    with oLoadLevel
    {
        global.firstCustomLevel = levelName;
        scrLoadLevel(0);
    }
}
sprite_index = sLoadButton;

