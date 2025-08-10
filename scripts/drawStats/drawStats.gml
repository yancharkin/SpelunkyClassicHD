function drawStats(){
	if (isLevel() and (global.currLevel > 0)) {
		if (global.locale != "ar") {
			drawText(tr("LEVEL ") + string(global.currLevel), "small", c_ltgray, 8, 8);
			drawText(tr("DEPTH: ") + string(playerDepth) + tr(" FEET"), "small", c_ltgray, 8, 16);
			drawText(tr("MONEY:  ") + string(global.money), "small", c_gray, 8, 32);
		    drawText(tr("KILLS:  ") + string(global.kills), "small", c_gray, 8, 40);
		} else {
			drawTextRtl(tr("LEVEL ") + string(global.currLevel), "small", c_ltgray, 0, 8);
			drawTextRtl(tr("DEPTH: ") + string(playerDepth) + tr(" FEET"), "small",  c_ltgray, 0, 16);
			drawTextRtl(tr("MONEY:  ") + string(global.money), "small", c_gray,  0, 32);
		    drawTextRtl(tr("KILLS:  ") + string(global.kills), "small", c_gray, -8, 40);
		}
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
		if (global.locale != "ar") {
			drawText(tr("TIME:  ") + string(m) + ":" + s + " / " + string(m2) + ":" + s2, "small", c_gray, 8, 48);
			drawText(tr("SAVES:  ") + string(global.damsels), "small", c_gray, 8, 56);
		} else {
			drawTextRtl(tr("TIME:  ") + string(m) + ":" + s + " / " + string(m2) + ":" + s2, "small",  c_gray, 0, 48);
			drawTextRtl(tr("SAVES:  ") + string(global.damsels), "small",  c_gray, 0, 56);
		}
	};
}
