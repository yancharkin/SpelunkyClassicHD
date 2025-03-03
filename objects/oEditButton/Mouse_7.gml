if (sprite_index == sEditButtonPressed)
{
    oLevelEditor.status = 2;
    with oNewButton { instance_destroy(); }
    with oTestButton { instance_destroy(); }
    instance_destroy();
}
sprite_index = sEditButton;
