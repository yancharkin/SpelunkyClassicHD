if (fired == 0 and abs(oPlayer1.y-y-8) < 8 and oPlayer1.x < x+8 and
    point_distance(x+8, y+8, oPlayer1.x, oPlayer1.y) < 128 and (abs(oPlayer1.xVel) > 0 or abs(oPlayer1.yVel) > 0))
{
    arrow = instance_create(x-16, y+4, oArrow);
    arrow.xVel = -8;
    fired += 1;
    sound_play(sndArrowTrap);
}

obj = instance_nearest(x, y, oEnemy);
if (obj) {
if (fired == 0 and abs(obj.y-y-8) < 8 and obj.x < x and
    point_distance(x, y, obj.x, obj.y) < 128 and (abs(obj.xVel) > 0 or abs(obj.yVel) > 0))
{
    arrow = instance_create(x-16, y+4, oArrow);
    arrow.xVel = -8;
    fired += 1;
    sound_play(sndArrowTrap);
}}

obj = instance_nearest(x, y, oMoveableSolid);
if (obj) {
if (fired == 0 and abs(obj.y-y-8) < 8 and obj.x < x and
    point_distance(x, y, obj.x, obj.y) < 128)
{
    arrow = instance_create(x-16, y+4, oArrow);
    arrow.xVel = -8;
    fired += 1;
    sound_play(sndArrowTrap);
}}

obj = instance_nearest(x-16, y, oItem);
if (obj) {
if (fired == 0 and abs(obj.y-y-8) < 8 and obj.x < x+8 and
    point_distance(x+8, y+8, obj.x, obj.y) < 128 and (abs(obj.xVel) > 0 or abs(obj.yVel) > 0))
{
    arrow = instance_create(x-16, y+4, oArrow);
    arrow.xVel = -8;
    fired += 1;
    sound_play(sndArrowTrap);
}}
x = ceil(x);
y = ceil(y);
