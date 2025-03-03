action_inherited();
image_speed = 0.3;
makeActive();
setCollisionBounds(-4, -4, 4, 4);
xVel = random(4) - random(4);
yVel = -1 - random(2);
grav = 0.6
invincible = true;
bounce = true;

n = rand(1,3);

if (n == 1) sprite_index = sOlmecDebris2;
else if (n == 2) sprite_index = sOlmecDebris3;
