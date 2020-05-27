///showMessages
if (global.messageTimer > 0) {
    if (global.html5Build) {
        y1 = view_yview[0] + 216 + 8 - global.fontSmallHeight;
        y2 = y1 + global.fontSmallHeight;
        if (is_array(global.message)) {
            drawHighlightedMessage(global.message, view_xview[0], y1, 1);
        } else {
            drawMessage(global.message, 'small', c_white, view_xview[0], y1, 1);
        }
        if (is_array(global.message2)) {
            drawHighlightedMessage(global.message2, view_xview[0], y2, 2);
        } else {
            drawMessage(global.message2, 'small', c_white, view_xview[0], y2, 2);
        }
    } else {
        y1 = 216 + 8 - global.fontSmallHeight;
        y2 = y1 + global.fontSmallHeight;
        if (is_array(global.message)) {
            drawHighlightedMessage(global.message, 0, y1, 1);
        } else {
            drawMessage(global.message, 'small', c_white, 0, y1, 1);
        }
        if (is_array(global.message2)) {
            drawHighlightedMessage(global.message2, 0, y2, 2);
        } else {
            drawMessage(global.message2, 'small', c_white, 0, y2, 2);
        }
    }
    global.messageTimer -= 1;
}
