///drawTextHCentered(text, fontSize, color, offsetX, posY)

var text = argument[0];
var fontSize = argument[1];
var color = argument[2];
var offsetX = argument[3];
var posY = argument[4];

if (fontSize = 'small') {
    strLen = string_length(text)*8;
    draw_set_font(global.myFontSmall);

} else {
    strLen = string_length(text)*16;
    draw_set_font(global.myFont);
}

posX = ceil((global.display_w - strLen) / 2);
draw_set_color(color);
draw_text(posX + offsetX, posY, text);
