var text = "";
if (instance_exists(oPlayer1)) {
    player = instance_nearest(0, 0, oPlayer1);
    if (player.x > anchorX) {    
        if (!pressStartBlink) {
            if (global.gamepadOn) {
                text = tr("PRESS START TO SHOW THE MENU");
            } else {
                if (!global.mobileBuild) {
                    text = tr("PRESS ESC TO SHOW THE MENU");
                }
            }
            draw_set_font(global.fontSmall);
            draw_set_color(c_white);
            strLen = string_length(text)*global.fontSmallWidth;
            posX = anchorX + ceil(( __view_get( e__VW.WView, 0 ) - strLen) / 2);
            draw_text(posX, 108, string_hash_to_newline(text));
        }
    }
}

