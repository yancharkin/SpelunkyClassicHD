action_inherited();
type = "Damsel"
makeActive();
setCollisionBounds(-4, -4, 4, 8);
image_speed = 0.5;
trigger = true;
startled = false;
invincible = false;
swimming = false;
heavy = true;
cost = getKissValue() * 3;
if (global.isDamsel) buyMessage = tr("I'LL LET YOU HAVE HIM FOR $") + string(cost) + "!";
else buyMessage = tr("I'LL LET YOU HAVE HER FOR $") + string(cost) + "!";

hp = 4;
bloodLeft = 4;
favor = 8;
sacCount = 20;

IDLE = 0;
RUN = 1;
THROWN = 2;
YELL = 3;
EXIT = 4;
SLAVE = 5;
KISS = 6;
DEAD = 99;
dead = false;
status = IDLE;
hit = 0;

facing = LEFT;

bounced = false;
burning = false;
counter = 200;
stunMax = 120;

bombID = 0;

