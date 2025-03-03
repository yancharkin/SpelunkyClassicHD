if (instance_exists(oPlayer1)) {
    if (abs(oPlayer1.x - (x+8)) < 8) {
        drawTextHCentered(tr("PRESS UP TO ENTER!"), "small", c_white, 0, 216)
    }
}
draw_sprite(sprite_index, image_index, x, y);

