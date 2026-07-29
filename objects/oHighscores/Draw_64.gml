ini_open(getWorkingDirPath("spelunky.ini"));
var strLen;
if (oPlayer1.y < 156)
{
	strLen = string_length(tr("SECRET CHALLENGES"))*global.fontSmallWidth;
	drawTextWithHash(tr("SECRET CHALLENGES"), "small", c_yellow, global.room_offset + 112 + int64(192 - strLen)/2, 32);
    var tMini1 = floor(ini_read_real("highscore","value10",0) / 10000);
    var tMini2 = floor((ini_read_real("highscore","value10",0)-(tMini1*10000)) / 100);
    var tMini3 = floor(ini_read_real("highscore","value10",0)-(tMini1*10000)-(tMini2*100));

	if (global.locale != "ar") {
		drawTextWithHash(tr("SUN:   ") + string(tMini1), "small", c_white, global.room_offset + 120, 48);
		drawTextWithHash(tr("MOON:  ") + string(tMini2), "small", c_white, global.room_offset + 120, 64);
		drawTextWithHash(tr("STARS: ") + string(tMini3), "small", c_white, global.room_offset + 120, 80);
	} else {
		drawTextRtlHs(tr("SUN:   ") + string(tMini1), c_white, 0, 48);
		drawTextRtlHs(tr("MOON:  ") + string(tMini2), c_white, 0, 64);
		drawTextRtlHs(tr("STARS: ") + string(tMini3), c_white, 0, 80);
	}
    
    if (oPlayer1.y < 48+16)
    {
		strLen = string_length(tr("SUN ROOM"))*global.fontSmallWidth;
		drawTextWithHash(tr("SUN ROOM"), "small", c_yellow, global.room_offset + 112 + int64(192 - strLen)/2, 96);
        if (tMoney >= sunGold)
        {
            if (false) // (global.isTunnelMan)
            {
                //draw_text(128, 112, string_hash_to_newline("NO MATTOCKS ALLOWED!"));
                //draw_text(128, 128, string_hash_to_newline("THIS MEANS YOU!"));
                //draw_text(128, 144, string_hash_to_newline(""));
                //draw_text(128, 160, string_hash_to_newline(""));
            }
            else
            {		
				if (global.locale != "ar") {
					drawTextWithHash(tr("KEEP YOURSELF AND"), "small", c_white, global.room_offset + 120, 112);
	                drawTextWithHash(tr("THE DAMSEL ALIVE"), "small", c_white, global.room_offset + 120, 128);
	                drawTextWithHash(tr("FOR AS LONG AS"), "small", c_white, global.room_offset + 120, 144);
	                drawTextWithHash(tr("POSSIBLE!"), "small", c_white, global.room_offset + 120, 160);
				} else {
					drawTextRtlHs(tr("KEEP YOURSELF AND"), c_white, 0, 112);
	                drawTextRtlHs(tr("THE DAMSEL ALIVE"), c_white, 0, 128);
	                drawTextRtlHs(tr("FOR AS LONG AS"), c_white, 0, 144);
	                drawTextRtlHs(tr("POSSIBLE!"), c_white, 0, 160);
				}
            }
        }
        else
        {
            if (global.locale != "ar") {
				drawTextWithHash(tr("LOCKED."), "small", c_white, global.room_offset + 120, 112);
			} else {
				drawTextRtlHs(tr("LOCKED."), c_white, 0, 112);
			}
        }
    }
    else if (oPlayer1.y < 80+16)
    {
		strLen = string_length(tr("MOON ROOM"))*global.fontSmallWidth;
		drawTextWithHash(tr("MOON ROOM"), "small", c_yellow, global.room_offset + 112 + int64(192 - strLen)/2, 96);
        if (tTime > 0 and tTime <= moonGold)
        {
            if (false) // (global.isTunnelMan)
            {
                //draw_text(128, 112, string_hash_to_newline("NO MATTOCKS ALLOWED!"));
                //draw_text(128, 128, string_hash_to_newline("THIS MEANS YOU!"));
                //draw_text(128, 144, string_hash_to_newline(""));
                //draw_text(128, 160, string_hash_to_newline(""));
            }
            else
            {
				if (global.locale != "ar") {
					drawTextWithHash(tr("SHOOT THE MOVING"), "small",  c_white, global.room_offset + 120, 112);
	                drawTextWithHash(tr("TARGETS WITH YOUR"), "small",  c_white, global.room_offset + 120, 128);
	                drawTextWithHash(tr("BOW AND ARROWS!"), "small",  c_white, global.room_offset + 120, 144);
				} else {
					drawTextRtlHs(tr("SHOOT THE MOVING"), c_white, 0, 112);
	                drawTextRtlHs(tr("TARGETS WITH YOUR"), c_white, 0, 128);
	                drawTextRtlHs(tr("BOW AND ARROWS!"), c_white, 0, 144);
				}
            }
        }
        else
        {
            if (global.locale != "ar") {
				drawTextWithHash(tr("LOCKED."), "small", c_white, global.room_offset + 120, 112);
			} else {
				drawTextRtlHs(tr("LOCKED."), c_white, 0, 112);
			}
        }
    }
    else if (oPlayer1.y < 112+16)
    {
		strLen = string_length(tr("STARS ROOM"))*global.fontSmallWidth;
		drawTextWithHash(tr("STARS ROOM"), "small", c_yellow, global.room_offset + 112 + int64(192 - strLen)/2, 96);
        if (tKills >= starsGold)
        {
            if (false) // (global.isTunnelMan)
            {
                //draw_text(128, 112, string_hash_to_newline("NO MATTOCKS ALLOWED!"));
                //draw_text(128, 128, string_hash_to_newline("THIS MEANS YOU!"));
                //draw_text(128, 144, string_hash_to_newline(""));
                //draw_text(128, 160, string_hash_to_newline(""));
            }
            else
            {
                if (global.locale != "ar") {
					drawTextWithHash(tr("KILL AS MANY ANGRY"), "small", c_white, global.room_offset + 120, 112);
	                drawTextWithHash(tr("SHOPKEEPERS AS YOU CAN"), "small", c_white, global.room_offset + 120, 128);
	                drawTextWithHash(tr("BEFORE THEY GET YOU!"), "small", c_white, global.room_offset + 120, 144);
				} else {
					drawTextRtlHs(tr("KILL AS MANY ANGRY"), c_white, 0, 112);
	                drawTextRtlHs(tr("SHOPKEEPERS AS YOU CAN"), c_white, 0, 128);
	                drawTextRtlHs(tr("BEFORE THEY GET YOU!"), c_white, 0, 144);
				}
            }
        }
        else
        {
            if (global.locale != "ar") {
				drawTextWithHash(tr("LOCKED."), "small", c_white, global.room_offset + 120, 112);
			} else {
				drawTextRtlHs(tr("LOCKED."), c_white, 0, 112);
			}
        }
    }
    else if (oPlayer1.y < 160)
    {
		strLen = string_length(tr("CHANGING ROOM"))*global.fontSmallWidth;
		drawTextWithHash(tr("CHANGING ROOM"), "small", c_yellow, global.room_offset + 112 + int64(192 - strLen)/2, 96);
        if (tSaves >= 8)
        {
			if (global.locale != "ar") {
				drawTextWithHash(tr("LADY IN RED..."), "small", c_white, global.room_offset + 120, 112);
			} else {
				drawTextRtlHs(tr("LADY IN RED..."), c_white, 0, 112);
			}
        }
        else
        {
            if (global.locale != "ar") {
				drawTextWithHash(tr("LOCKED."), "small", c_white, global.room_offset + 120, 112);
			} else {
				drawTextRtlHs(tr("LOCKED."), c_white, 0, 112);
			}
        }
        with oNew
        {
            visible = false;
        }
    }
    
}
else
{
with oNew
{
	if (global.locale = "ar") x = 128;
    visible = true;
}
strLen = string_length(tr("TOP DEFILERS"))*global.fontSmallWidth;
drawTextWithHash(tr("TOP DEFILERS"), "small", c_yellow, global.room_offset + 112 + int64(192 - strLen)/2, 32);
if (global.locale != "ar") {
	drawTextWithHash(tr("MONEY:  ")  + string(tMoney), "small", c_white, global.room_offset + 120, 48);
	drawTextWithHash(tr("KILLS:  ") + string(tKills), "small",  c_white, global.room_offset + 120, 64);
	drawTextWithHash(tr("SAVES:  ") + string(tSaves), "small",  c_white, global.room_offset + 120, 80);
} else {
	drawTextRtlHs(tr("MONEY:  ")  + string(tMoney), c_white, 0, 48);
	drawTextRtlHs(tr("KILLS:  ") + string(tKills), c_white, 8, 64);
	drawTextRtlHs(tr("SAVES:  ") + string(tSaves), c_white, 0, 80);
}

// only display time if won
if (ini_read_real("highscore","value6",0)-0 > 0)
{
    s = ini_read_real("highscore","value2",0)-0;
    // s = floor(s / 1000);
    m = 0;
    while (s > 59)
    {
        s -= 60;
        m += 1;
    }
	var t = string(m) + ":" + string(s);
	 if (s < 10) t = string(m) + ":0" + string(s);
	 if (global.locale != "ar") {
		drawTextWithHash(tr("TIME:  ") + string(t), "small", c_white, global.room_offset + 120, 96);
	 } else {
		 drawTextRtlHs(tr("TIME:  ") + string(t), c_white, 0, 96);
	 }
}

strLen = string_length(tr("STATISTICS"))*global.fontSmallWidth;
drawTextWithHash(tr("STATISTICS"), "small", c_yellow, global.room_offset + 112 + int64(192 - strLen)/2, 112);
if (global.locale != "ar") {
	drawTextWithHash(tr("PLAYS:  ") + string(ini_read_real("highscore","value5",0)-0), "small",  c_white, global.room_offset + 120, 128);
	drawTextWithHash(tr("DEATHS: ") + string(ini_read_real("highscore","value7",0)-0), "small",  c_white, global.room_offset + 120, 144);
	drawTextWithHash(tr("WINS:   ") + string(ini_read_real("highscore","value6",0)-0), "small",  c_white, global.room_offset + 120, 160);
} else {
	drawTextRtlHs(tr("PLAYS:  ") + string(ini_read_real("highscore","value5",0)-0), c_white, 0, 128);
	drawTextRtlHs(tr("DEATHS: ") + string(ini_read_real("highscore","value7",0)-0), c_white, 0, 144);
	drawTextRtlHs(tr("WINS:   ") + string(ini_read_real("highscore","value6",0)-0), c_white, 0, 160);
}
var block = instance_nearest(160, 240, oPushBlock);
if (not oButtonHighscore.pushed and block.x > 160)
{
	drawMessage(tr("THIS WILL CLEAR EVERYTHING!"), "small", c_yellow, 0, 216, 2)
}}

ini_close()
