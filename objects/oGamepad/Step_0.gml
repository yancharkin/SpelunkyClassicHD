/// @description Do gamepad stuff.

if (!global.gamepadOn) exit;

/////////////
// START
/////////////

startReleased = false;
startPressed = false;
if (start)
{
    if (scrNotTrigger(global.joyStartVal))
        start = gamepad_button_check(global.joyid, global.joyStartVal);
    else
        start = gamepad_button_value(global.joyid, global.joyStartVal) > 0.6;
        
    if (not start) startReleased = true;
}
else
{
    if (scrNotTrigger(global.joyStartVal))
        start = gamepad_button_check(global.joyid, global.joyStartVal);
    else
        start = gamepad_button_value(global.joyid, global.joyStartVal) > 0.6;
        
    if (start) startPressed = true;
}

/////////////
// LEFT
/////////////

leftReleased = false;
leftPressed = false;
if (left)
{
    left = (gamepad_button_check(global.joyid, gp_padl) || gamepad_axis_value(global.joyid, gp_axislh) < -0.6);

    if (not left) leftReleased = true;
}
else
{
    left = (gamepad_button_check(global.joyid, gp_padl) || gamepad_axis_value(global.joyid, gp_axislh) < -0.6);
    
    if (left) leftPressed = true;
}

/////////////
// RIGHT
/////////////

rightReleased = false;
rightPressed = false;
if (right)
{
    right = (gamepad_button_check(global.joyid, gp_padr) || gamepad_axis_value(global.joyid, gp_axislh) > 0.6);

    if (not right) rightReleased = true;
}
else
{
    right = (gamepad_button_check(global.joyid, gp_padr) || gamepad_axis_value(global.joyid, gp_axislh) > 0.6);
    
    if (right) rightPressed = true;
}

/////////////
// UP
/////////////

upReleased = false;
upPressed = false;
if (up)
{
    up = (gamepad_button_check(global.joyid, gp_padu) || gamepad_axis_value(global.joyid, gp_axislv) < -0.6);

    if (not up) upReleased = true;
}
else
{
    up = (gamepad_button_check(global.joyid, gp_padu) || gamepad_axis_value(global.joyid, gp_axislv) < -0.6);
    
    if (up) upPressed = true;
}

/////////////
// DOWN
/////////////

downReleased = false;
downPressed = false;
if (down)
{
    down = (gamepad_button_check(global.joyid, gp_padd) || gamepad_axis_value(global.joyid, gp_axislv) > 0.6);

    if (not down) downReleased = true;
}
else
{
    down = (gamepad_button_check(global.joyid, gp_padd) || gamepad_axis_value(global.joyid, gp_axislv) > 0.6);
    
    if (down) downPressed = true;
}

/////////////
// JUMP
/////////////

jumpReleased = false;
jumpPressed = false;
if (jump)
{
    if (scrNotTrigger(global.joyJumpVal))
        jump = gamepad_button_check(global.joyid, global.joyJumpVal);
    else
        jump = gamepad_button_value(global.joyid, global.joyJumpVal) > 0.6;
    
    if (not jump) jumpReleased = true;
}
else
{
    if (scrNotTrigger(global.joyJumpVal))
        jump = gamepad_button_check(global.joyid, global.joyJumpVal);
    else
        jump = gamepad_button_value(global.joyid, global.joyJumpVal) > 0.6;
    
    if (jump) jumpPressed = true;
}

/////////////
// ATTACK
/////////////

attackReleased = false;
attackPressed = false;
if (attack)
{
    if (scrNotTrigger(global.joyAttackVal))
        attack = gamepad_button_check(global.joyid, global.joyAttackVal);
    else
        attack = gamepad_button_value(global.joyid, global.joyAttackVal) > 0.6;
    
    if (not attack) attackReleased = true;
}
else
{
    if (scrNotTrigger(global.joyAttackVal))
        attack = gamepad_button_check(global.joyid, global.joyAttackVal);
    else
        attack = gamepad_button_value(global.joyid, global.joyAttackVal) > 0.6;
    
    if (attack) attackPressed = true;
}

////////////
// ITEM
////////////

itemReleased = false;
itemPressed = false;
if (item)
{
    if (scrNotTrigger(global.joyItemVal))
        item = gamepad_button_check(global.joyid, global.joyItemVal);
    else
        item = gamepad_button_value(global.joyid, global.joyItemVal) > 0.6;
    
    if (not item) itemReleased = true;
}
else
{
    if (scrNotTrigger(global.joyItemVal))
        item = gamepad_button_check(global.joyid, global.joyItemVal);
    else
        item = gamepad_button_value(global.joyid, global.joyItemVal) > 0.6;
    
    if (item) itemPressed = true;
}

////////////
// RUN
////////////

if (scrNotTrigger(global.joyRunVal))
    run = gamepad_button_check(global.joyid, global.joyRunVal);
else
    run = gamepad_button_value(global.joyid, global.joyRunVal) > 0.6;

////////////
// BOMB
////////////

bombReleased = false;
bombPressed = false;
if (bomb)
{
    if (scrNotTrigger(global.joyBombVal))
        bomb = gamepad_button_check(global.joyid, global.joyBombVal);
    else
        bomb = gamepad_button_check(global.joyid, global.joyBombVal) > 0.6;
    
    if (not bomb) bombReleased = true;
}
else
{
    if (scrNotTrigger(global.joyBombVal))
        bomb = gamepad_button_check(global.joyid, global.joyBombVal);
    else
        bomb = gamepad_button_check(global.joyid, global.joyBombVal) > 0.6;
    
    if (bomb) bombPressed = true;
}

////////////
// ROPE
////////////

ropeReleased = false;
ropePressed = false;
if (rope)
{
    if (scrNotTrigger(global.joyRopeVal))
        rope = gamepad_button_check(global.joyid, global.joyRopeVal);
    else
        rope = gamepad_button_value(global.joyid, global.joyRopeVal) > 0.6;
    
    if (not rope) ropeReleased = true;
}
else
{
    if (scrNotTrigger(global.joyRopeVal))
        rope = gamepad_button_check(global.joyid, global.joyRopeVal);
    else
        rope = gamepad_button_value(global.joyid, global.joyRopeVal) > 0.6;
    
    if (rope) ropePressed = true;
}

////////////
// FLARE
////////////

flareReleased = false;
flarePressed = false;
if (flare)
{
    if (scrNotTrigger(global.joyFlareVal))
        flare = gamepad_button_check(global.joyid, global.joyFlareVal);
    else
        flare = gamepad_button_value(global.joyid, global.joyFlareVal) > 0.6;
    
    if (not flare) flareReleased = true;
}
else
{
    if (scrNotTrigger(global.joyFlareVal))
        flare = gamepad_button_check(global.joyid, global.joyFlareVal);
    else
        flare = gamepad_button_value(global.joyid, global.joyFlareVal) > 0.6;
    
    if (flare) flarePressed = true;
}

////////////
// PAY
////////////

payReleased = false;
payPressed = false;
if (pay)
{
    if (scrNotTrigger(global.joyPayVal))
        pay = gamepad_button_check(global.joyid, global.joyPayVal);
    else
        pay = gamepad_button_value(global.joyid, global.joyPayVal) > 0.6;
    
    if (not pay) payReleased = true;
}
else
{
    if (scrNotTrigger(global.joyPayVal))
        pay = gamepad_button_check(global.joyid, global.joyPayVal);
    else
        pay = gamepad_button_value(global.joyid, global.joyPayVal) > 0.6;
    
    if (pay) payPressed = true;
}

////////////
// SELECT
////////////
select = gamepad_button_check_pressed(global.joyid, gp_select);

