instance_create(0, 0, oHtml5Gamepad);
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

///Gamepad in HTML5
global.bStartPressed = false;
global.bStartPreviousState = false;
global.bJumpPressed = false;
global.bJumpPressedPreviousState = false;
global.bJumpReleased = false;
global.bJumpReleasedPreviousState = false;
global.bAttackPressed = false;
global.bAttackPressedPreviousState = false;
global.bAttackReleased = false;
global.bAttackReleasedPreviousState = false;

