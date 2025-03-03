if (checkStartPressed() or gamepad.attackPressed)
{
    with oLoadLevel
    {
        global.firstCustomLevel = levelName;
        scrLoadLevel(0);
    }
}

