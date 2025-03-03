if (counter > 0) {
    counter -= 1;
    x += xVel;
    if (xVel > 0) dir = 0;
    else dir = 180;
} else {
    enemy_exists = instance_exists(oEnemy);
    damsel_exists = instance_exists(oDamsel);
    if (enemy_exists or damsel_exists){
        if (enemy_exists) var enemy = instance_nearest(x, y, oEnemy);
        if (damsel_exists) var damsel = instance_nearest(x, y, oDamsel);
        if (enemy_exists and damsel_exists){
             if (point_distance(x, y, enemy.x, enemy.y) < point_distance(x, y, damsel.x, damsel.y)) {
                obj = enemy;
             } else {
                obj = damsel;
             }
        } else if (enemy_exists) {
            obj = instance_nearest(x, y, oEnemy);
        } else if (damsel_exists) {
            obj = instance_nearest(x, y, oDamsel);
        }
        dir = point_direction(x, y, obj.x+8, obj.y+8);
    }
    x += 2 * cos(degtorad(dir));
    y += -2 * sin(degtorad(dir));
}

