///drawText(text, fontSize, color, posX, posY)

var text = argument[0];
var fontSize = argument[1];
var color = argument[2];
var posX = argument[3];
var posY = argument[4];

if (fontSize = 'small') {
    draw_set_font(global.myFontSmall);

} else {
    draw_set_font(global.myFont);
}

draw_set_color(color);
draw_text(posX, posY, text);
