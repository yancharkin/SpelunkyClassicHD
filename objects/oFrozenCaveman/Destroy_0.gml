if (not global.cleanSolids)
{
    enemy = instance_create(x, y, oCaveman);
    enemy.invincible = 20;
    enemy.status = 98;
    enemy.counter = enemy.stunTime;
}
