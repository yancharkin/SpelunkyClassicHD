action_inherited();
makeActive();
setCollisionBounds(-4, -4, 4, 4);
life = 60;
grav = 0.6;
bounce = true;
dying = false;
invincible = false;

if (instance_number(oDetritus) > 32) instance_destroy();
