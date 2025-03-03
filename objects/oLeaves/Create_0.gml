if (global.cemetary) sprite_index = sLeavesDead;

if (collision_point(x-16, y, oTree, 0, 0) or collision_point(x-16, y, oLeaves, 0, 0))
{
    if (global.cemetary) sprite_index = sLeavesDeadR;
    else sprite_index = sLeavesRight;
}

spriteSet = false;
