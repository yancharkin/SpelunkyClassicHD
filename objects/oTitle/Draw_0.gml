if (instance_exists(oFlare) and needDark) {
    dist = 160 - oFlare.y;
    if (dist < 0) dist = 0;
    darkness = dist / 160;
    if (darkness == 0) needDark = false;
}
draw_set_alpha(1);