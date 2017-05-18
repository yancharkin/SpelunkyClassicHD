/*
An object can only use this script after calling "setCollisionBounds."
0: Number of pixels right of the collision rectangle to check for a collision
with a solid object.
*/
calculateCollisionBounds()
if collision_line(round(rb+argument0-1),round(tb),round(rb+argument0-1),round(bb-1),oSolid,1,1)>0
{
  return 1
}
return 0
