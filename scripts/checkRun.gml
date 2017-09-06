if (gamepad.run)
    return gamepad.run;
else
    if (!global.mobileBuild)
        return (keyboard_check(global.keyRunVal));
    else
        return global.toggleRun;
