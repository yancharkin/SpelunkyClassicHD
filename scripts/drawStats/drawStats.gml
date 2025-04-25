function drawStats(){
	if (isLevel() and (global.currLevel > 0)) {
		draw_set_color(c_ltgray);
		draw_set_font(global.fontSmall);
		draw_text(8, 8, string_hash_to_newline(tr("LEVEL ") + string(global.currLevel)));
	    draw_text(8, 16, string_hash_to_newline(tr("DEPTH: ") + string(playerDepth) + tr(" FEET")));
		draw_set_color(c_gray);
	    draw_text(8, 32, string_hash_to_newline(tr("MONEY:  ") + string(global.money)));
	    draw_text(8, 40, string_hash_to_newline(tr("KILLS:  ") + string(global.kills)));
		var s = global.xtime;
        s = floor(s / 1000);
        var m = 0;
        while (s > 59) {
            s -= 60;
            m += 1;
        }
        if (s < 10) s = "0" + string(s);
        else s = string(s);
        var s2 = global.time;
        s2 = floor(s2 / 1000);
        var m2 = 0;
        while (s2 > 59) {
            s2 -= 60;
            m2 += 1;
        }
        if (s2 < 10) s2 = "0" + string(s2);
        else s2 = string(s2);
        draw_text(8, 48, string_hash_to_newline(tr("TIME:  ") + string(m) + ":" + s + " / " + string(m2) + ":" + s2));
		draw_text(8, 56, string_hash_to_newline(tr("SAVES:  ") + string(global.damsels)));
	};
}