/*
An object can only use this script after calling "setCollisionBounds."
0: Number of pixels right of the collision rectangle to check for a collision
with a solid object.
returns the ID of the solid
*/
calculateCollisionBounds()
return collision_line(round(rb+argument0-1),round(tb+5),round(rb+argument0-1),round(bb-1),oSolid,1,1)
