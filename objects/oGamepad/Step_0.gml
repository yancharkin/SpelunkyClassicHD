/// @description Do gamepad stuff.

if (!global.gamepadOn) exit;

/////////////
// START
/////////////

startReleased = false;
startPressed = false;
if (start) {
    start = gamepadButtonCheck(global.joyStartVal);
    if (not start) startReleased = true;
} else {
	start = gamepadButtonCheck(global.joyStartVal)
    if (start) startPressed = true;
}

/////////////
// LEFT
/////////////

leftReleased = false;
leftPressed = false;
if (left) {
	left = (gamepadButtonCheck(global.joyLeftVal) || gamepad_axis_value(global.joyid, gp_axislh) < -0.6);
    if (not left) leftReleased = true;
} else {
    left = (gamepadButtonCheck(global.joyLeftVal) || gamepad_axis_value(global.joyid, gp_axislh) < -0.6);
    if (left) leftPressed = true;
}

/////////////
// RIGHT
/////////////

rightReleased = false;
rightPressed = false;
if (right) {
	right = (gamepadButtonCheck(global.joyRightVal) || gamepad_axis_value(global.joyid, gp_axislh) > 0.6);
    if (not right) rightReleased = true;
} else {
	right = (gamepadButtonCheck(global.joyRightVal) || gamepad_axis_value(global.joyid, gp_axislh) > 0.6);
    if (right) rightPressed = true;
}

/////////////
// UP
/////////////

upReleased = false;
upPressed = false;
if (up) {
	up = (gamepadButtonCheck(global.joyUpVal) || gamepad_axis_value(global.joyid, gp_axislv) < -0.6);
    if (not up) upReleased = true;
}
else {
    up = (gamepadButtonCheck(global.joyUpVal) || gamepad_axis_value(global.joyid, gp_axislv) < -0.6);
    if (up) upPressed = true;
}

/////////////
// DOWN
/////////////

downReleased = false;
downPressed = false;
if (down) {
	down = (gamepadButtonCheck(global.joyDownVal) || gamepad_axis_value(global.joyid, gp_axislv) > 0.6);
    if (not down) downReleased = true;
} else{
    down = (gamepadButtonCheck(global.joyDownVal) || gamepad_axis_value(global.joyid, gp_axislv) > 0.6);
    if (down) downPressed = true;
}

/////////////
// JUMP
/////////////

jumpReleased = false;
jumpPressed = false;
if (jump) {
	jump = gamepadButtonCheck(global.joyJumpVal);
    if (not jump) jumpReleased = true;
} else {
	jump = gamepadButtonCheck(global.joyJumpVal);
    if (jump) jumpPressed = true;
}

/////////////
// ATTACK
/////////////

attackReleased = false;
attackPressed = false;
if (attack) {
    attack = gamepadButtonCheck(global.joyAttackVal);
    if (not attack) attackReleased = true;
} else {
    attack = gamepadButtonCheck(global.joyAttackVal);
    if (attack) attackPressed = true;
}

////////////
// ITEM
////////////

itemReleased = false;
itemPressed = false;
if (item) {
    item = gamepadButtonCheck(global.joyItemVal);
    if (not item) itemReleased = true;
} else {
    item = gamepadButtonCheck(global.joyItemVal);
    if (item) itemPressed = true;
}

////////////
// RUN
////////////

runReleased = false;
runPressed = false;
if (run) {
	run = gamepadButtonCheck(global.joyRunVal)
    if (not run) runReleased = true;
} else {
	run = gamepadButtonCheck(global.joyRunVal)
    if (run) runPressed = true;
}

////////////
// BOMB
////////////

bombReleased = false;
bombPressed = false;
if (bomb) {
    bomb = gamepadButtonCheck(global.joyBombVal);
    if (not bomb) bombReleased = true;
} else {
    bomb = gamepadButtonCheck(global.joyBombVal);
    if (bomb) bombPressed = true;
}

////////////
// ROPE
////////////

ropeReleased = false;
ropePressed = false;
if (rope) {
    rope = gamepadButtonCheck(global.joyRopeVal);
    if (not rope) ropeReleased = true;
} else {
    rope = gamepadButtonCheck(global.joyRopeVal);
    if (rope) ropePressed = true;
}

////////////
// FLARE
////////////

flareReleased = false;
flarePressed = false;
if (flare) {
    flare = gamepadButtonCheck(global.joyFlareVal);
    if (not flare) flareReleased = true;
} else {
    flare = gamepadButtonCheck(global.joyFlareVal);
    if (flare) flarePressed = true;
}

////////////
// PAY
////////////

payReleased = false;
payPressed = false;
if (pay) {
    pay = gamepadButtonCheck(global.joyPayVal);
    if (not pay) payReleased = true;
} else {
    pay = gamepadButtonCheck(global.joyPayVal);
    if (pay) payPressed = true;
}

/////////////
// LANG
/////////////

langReleased = false;
langPressed = false;
if (lang) {
    lang = gamepadButtonCheck(global.joyLangVal);
    if (not lang) langReleased = true;
} else {
	lang = gamepadButtonCheck(global.joyLangVal);
    if (lang) langPressed = true;
}

////////////
// SELECT
////////////
//select = gamepad_button_check_pressed(global.joyid, gp_select);