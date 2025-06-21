if (instance_exists(oPlayer1)) {
    player = instance_nearest(0, 0, oPlayer1);    
    if (player.x < 256 and __view_get( e__VW.XView, 0 ) <= 1) {
        drawTextHCentered(tr("WELCOME TO THE SHORTCUT HOUSE!"), "small", c_white, 0, 224);
    }
}