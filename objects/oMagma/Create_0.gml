action_inherited();
image_speed = 0.3;
makeActive();
setCollisionBounds(-8, -8, 8, 8);
xVel = random(4) - random(4);
yVel = -1 - random(2);
grav = rand(1,6) * 0.1;
hp = 200;

alarm[0] = 2;
alarm[1] = 50;

