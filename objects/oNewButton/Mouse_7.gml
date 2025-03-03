if (sprite_index == sNewButtonPressed)
{
    oLevelEditor.status = 10;
    with oEditButton { instance_destroy(); }
    with oTestButton { instance_destroy(); }
    instance_destroy();
}
sprite_index = sNewButton;
