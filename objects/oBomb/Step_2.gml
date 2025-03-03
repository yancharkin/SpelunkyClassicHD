action_inherited();
if (!instance_exists(enemyID))
{
    enemyID = 0;
}

if (enemyID != 0)
{
    x = enemyID.x-stickyXDiff;
    y = enemyID.y-stickyYDiff;
}
