function drawCredits(color1, color2) {
	var X1 = 16;
	var X2 = 32;
	var X3 = 144;
	if (global.locale == "ar") {
		X1 = global.display_w - 16;
		X2 = global.display_w - 32;
		X3 = global.display_w - 144;
	}
	if (drawStatus == 1) {
		drawTextUni("SPELUNKY", "large", color1, X1, 16);
	} else if (drawStatus == 2) {
		drawTextUni(tr("A GAME BY"), "small", color1, X1, 16);
		drawTextUni("DEREK YU", "small", color2, X2, 32);
	} else if (drawStatus == 3) {
		drawTextUni(tr("PLATFORM ENGINE"), "small", color1, X1, 16);
		drawTextUni("MARTIN PIECYK", "small", color2, X2, 32);
		drawTextUni(tr("SOUND EFFECTS MADE USING"), "small", color1, X1, 48);
		drawTextUni("DR PETTER'S SFXR", "small", color2, X2, 64);
		drawTextUni(tr("SCREEN SCALING CODE"), "small", color1, X1, 80);

		drawTextUni("CHEVYRAY", "small", color2, X2, 96);
	} else if (drawStatus == 4) {
		drawTextUni(tr("MUSIC BY"), "small", color1, X1, 16);
		drawTextUni("GEORGE BUZINKAI", "small", color2, X2, 32);
		drawTextUni("JONATHAN PERRY", "small", color2, X2, 40);
	} else if (drawStatus == 5) {
		drawTextUni(tr("BETA TESTING BY"), "small", color1, X1, 16);
	    var testers = [
			"ANNABELLE K.", "BENZIDO", "CHUTUP", "CORPUS", "GENERALVALTER", "GUERT", "GRAHAM GORING",
			"HAOWAN", "HIDEOUS", "INANE", "INCREPARE", "KAO", "MARK JOHNS", "MELLY", "PAUL ERES",
			"SUPER JOE", "TANTAN", "TEAM QUIGGAN", "TERRY", "XION", "ZAPHOS"
		]
		for (var i = 0; i < array_length(testers); i++;) {
			var testerName = testers[i];
			var pX = X2;
			var pY = 32 + 8*i
			if (i >= 11) {
				pX = X3;
				pY = 32 + 8*i - 88
			}
			drawTextUni(testerName, "small", color2, pX, pY);
		};

	} else if (drawStatus == 6) {
		drawTextUni(tr("SPELUNKY CLASSIC HD BY"), "small", color1, X1, 16);
		drawTextUni("YANCHARKIN", "small", color2, X2, 32);
		drawTextUni(tr("CONTRIBUTORS"), "small", color1, X1, 48);
	    var hd_contributors  = [
			"NKRAPIVIN", "GRHEAVY", "SPENCJO", "GABRIEL ALBUQUERQUE FERREIRA", "BAKUSTARVER",
			"LERETARDATN", "MASTERPHW", "BRNBOT3K", "V9TN"
		]
		for (var i = 0; i < array_length(hd_contributors); i++;) {
			var contributorName = hd_contributors[i];
			var pX = X2;
			var pY = 64 + 8*i
			drawTextUni(contributorName, "small", color2, pX, pY);
		};
	} else if (drawStatus == 7) {
		drawTextUni(tr("THANKS FOR PLAYING!"), "small", color1, X1, 16);
		drawTextUni(tr("SEE YOU NEXT ADVENTURE!"), "small", color2, X2, 32);
	}

	if (fadeIn or fadeOut) {
	    draw_set_color(c_black);
	    draw_set_alpha(fadeLevel);
	    draw_rectangle(0, 0, global.display_w, 240, false);
	    draw_set_alpha(1);
	}
}