if (instance_exists(oFlare) and needDark) {
    dist = 160 - oFlare.y;
    if (dist < 0) dist = 0;
    darkness = dist / 160;
    if (darkness == 0) needDark = false;
}

draw_set_alpha(1);

if (instance_exists(oPlayer1)) {
    player = instance_nearest(0, 0, oPlayer1);    
    if (player.x < 256 and __view_get( e__VW.XView, 0 ) <= 1) {
        drawTextHCentered(tr("WELCOME TO THE SHORTCUT HOUSE!"), "small", c_white, 0, 224);
    }
}

