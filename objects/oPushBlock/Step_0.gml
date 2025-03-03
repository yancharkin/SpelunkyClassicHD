action_inherited();
if (collision_point(x+8, y+14, oLava, 0, 0) and not collision_point(x+8, y+17, oSolid, 0, 0))
{
    yVel = 0;
    myGrav = 0;
    scrMoveableSolidRecurseDrop();
    y += 0.05;
}
