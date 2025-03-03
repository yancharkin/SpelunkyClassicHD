if (sprite_index == sTestButtonPressed)
{
    with oLevelEditor
    {
        scrTestLevel();
    }
    room_goto(rLoadLevel);
}
sprite_index = sTestButton;
