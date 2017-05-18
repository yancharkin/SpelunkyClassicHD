/*
An object can only use this script after calling "setCollisionBounds."
0: Number of pixels above the collision rectangle to check for a collision
with an "oWater".
*/
calculateCollisionBounds()
if collision_line(round(lb),round(tb-argument0),round(rb-1),round(tb-argument0),oWater,1,1)>0
  return 1
return 0
