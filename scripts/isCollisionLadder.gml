/*
Returns whether the object invoking this script is colliding with a ladder.
return
0:no collision
1:collision
*/
calculateCollisionBounds()
if (collision_rectangle(lb+8,tb+8,rb-8,bb-8,oLadderTop,1,1) > 0)
    return true;
else return collision_rectangle(lb+8,tb+8,rb-8,bb-8,oLadder,1,1)>0
