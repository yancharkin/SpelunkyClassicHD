drawStatus = 0;
moneyCount = 0;
fadeOut = false;
fadeLevel = 0;

poop = false;

alarm[0] = 50;

with oMenu
{
    visible = false;
}

//TouchInput
if ((global.mobileBuild) or (global.html5Build)) {
    enableTouchInput();
}