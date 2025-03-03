/// @description showFinalScore(drawStatus, fadeOut)
/// @param drawStatus
/// @param  fadeOut
function showFinalScore() {

	var drawStatus = argument[0];
	var fadeOut = argument[1];

	screenCenter = ceil(global.display_w / 2);

	if (drawStatus > 0)
	{
	    drawTextHCentered(tr("YOU MADE IT!"), "large", c_yellow, -global.room_offset, 32);
	}
	if (drawStatus > 1)
	{
	    drawTextHCentered(tr("FINAL SCORE:"), "small", c_yellow, -global.room_offset, 56);
	}
	if (drawStatus > 2)
	{
	    drawTextHCentered("$" + string(moneyCount), "large", c_white, -global.room_offset, 72);
	}
	if (drawStatus > 4)
	{
	    s = global.time;
	    s = floor(s / 1000);
	    m = 0;
	    while (s > 59)
	    {
	        s -= 60;
	        m += 1;
	    }
	    drawText(tr("TIME:  "), "small", c_yellow, screenCenter-global.room_offset-96, 96);
	    if (s < 10) {
	        drawText(string(m) + ":0" + string(s), "small", c_white, screenCenter-global.room_offset+64, 96);
	    } else {
	        drawText(string(m) + ":" + string(s), "small", c_white, screenCenter-global.room_offset+64, 96);
	    }
	}
	if (drawStatus > 5)
	{
	    drawText(tr("KILLS:  "), "small", c_yellow, screenCenter-global.room_offset-96, 96+8);
	    drawText(global.kills, "small", c_white, screenCenter-global.room_offset+64, 96+8);
	}
	if (drawStatus > 6)
	{
	    drawText(tr("SAVES:  "), "small", c_yellow, screenCenter-global.room_offset-96, 96+16);
	    drawText(global.damsels, "small", c_white, screenCenter-global.room_offset+64, 96+16);
	}

	if (fadeOut)
	{
	    draw_set_color(c_black);
	    draw_set_alpha(fadeLevel);
	    draw_rectangle(-global.room_offset, 0, global.display_w, 240, false);
	    draw_set_alpha(1);
	}

	if (drawStatus == 8)
	{
	    drawTextHCentered(tr("YOU SHALL BE REMEMBERED AS A HERO."), "small", c_white, -global.room_offset, 116);;
	}



}
