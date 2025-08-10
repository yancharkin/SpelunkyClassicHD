drawTouchControls();

//draw_set_font(global.fontSmall);
//draw_set_color(c_white);
if (instance_exists(oTunnelMan))
{
    person = instance_nearest(176, 176, oTunnelMan);
    if (person.talk == 1)
    {
		drawTextHCentered(tr("HEY THERE! I'M THE TUNNEL MAN!"), "small", c_white, 0, 208);
		drawTextHCentered(tr("I DIG SHORTCUTS."), "small", c_white, 0, 216);
    }
    else if (person.talk == 2)
    {
		drawTextHCentered(tr("CAN YOU LEND ME A LITTLE MONEY?"), "small", c_white, 0, 208);
		if (isRoom("rTransition1x") or isRoom("rTransition3x")) drawTextHCentered(tr("I NEED $") + string(global.tunnel1) + tr(" FOR A NEW SHORTCUT."), "small", c_white, 0, 216);
        else drawTextHCentered(tr("I NEED $") + string(global.tunnel2) + tr(" FOR A NEW SHORTCUT."), "small", c_white, 0, 216);
		drawTextHCentered(tr("DONATE: ") + string(oTunnelMan.donate), "small", c_yellow, 0, 224);
    }
    else if (person.talk == 3)
    {
		drawTextHCentered(tr("THANKS! YOU WON'T REGRET IT!"), "small", c_white, 0, 216);
    }
    else if (person.talk == 4)
    {
		drawTextHCentered(tr("I'LL NEVER GET THIS SHORTCUT BUILT!"), "small", c_white, 0, 216);
    }
    else if (person.talk == 5)
    {
		drawTextHCentered(tr("ONE SHORTCUT, COMING UP!"), "small", c_white, 0, 216);
    }
}
else if (instance_exists(oDamselKiss))
{
    person = instance_nearest(176, 176, oDamselKiss);
    if (person.kissed)
    {
		drawTextHCentered(tr("MY HERO!"), "small", c_white, 0, 216);
    }
}
/* debug
else
{
        draw_text(global.room_offset + 8, 208, string(debugCounter));
        if (global.genBlackMarket) draw_text(global.room_offset + 8, 216, "MARKET : " + string(drawLoot) + " :$ " + string(moneyCount) + " :$ " + string(global.xmoney) + " :A " + string(alarm[0]) + " :A " + string(alarm[1]));
}
*/

if (global.locale != "ar") {
	if (global.customLevel) drawText(global.customLevelName + tr(" COMPLETED!"), "small", c_yellow, global.room_offset + 32, 48);
	else if (global.currLevel-1 < 1) drawText(tr("TUTORIAL CAVE COMPLETED!"),"small",  c_yellow, global.room_offset + 32, 48);
	else drawText(tr("LEVEL ") + string(global.currLevel-1) + tr(" COMPLETED!"),"small",  c_yellow, global.room_offset + 32, 48);
} else {
	drawTextRtlTransition(tr("TIME  = "), c_white, 0, 64);
	if (global.customLevel) drawTextRtlTransition(global.customLevelName + tr(" COMPLETED!"), c_yellow, 0, 48);
	else if (global.currLevel-1 < 1) drawTextRtlTransition(tr("TUTORIAL CAVE COMPLETED!"), c_yellow, 0, 48);
	else drawTextRtlTransition(tr("LEVEL ") + string(global.currLevel-1) + tr(" COMPLETED!"), c_yellow, 0, 48);
}
if (global.locale != "ar") {
	drawText(tr("TIME  = "),"small",  c_white, global.room_offset + 32, 64);
	drawText(tr("LOOT  = "),"small",  c_white, global.room_offset + 32, 80);
	drawText(tr("KILLS = "),"small",  c_white, global.room_offset + 32, 96);
	drawText(tr("MONEY = "),"small",  c_white, global.room_offset + 32, 112);
} else {
	drawTextRtlTransition(tr("TIME  = "), c_white, 0, 64);
	drawTextRtlTransition(tr("LOOT  = "), c_white, 0, 80);
	drawTextRtlTransition(tr("KILLS = "), c_white, 8, 96);
	drawTextRtlTransition(tr("MONEY = "),c_white, 0, 112);
}

if (drawLoot >= 1 and not isLoot)
{
	drawText(tr("NONE"),"small",  c_white, global.room_offset + 96, 80);
}

if (drawLoot > -2)
{
    s = global.xtime;
    s = floor(s / 1000);
    m = 0;
    while (s > 59)
    {
        s -= 60;
        m += 1;
    }
    
    // don't create a dark level if player is attempting a speed run
    if (s <= 20) global.noDarkLevel = true;
    else global.noDarkLevel = false;
    
    s2 = global.time;
    s2 = floor(s2 / 1000);
    m2 = 0;
    while (s2 > 59)
    {
        s2 -= 60;
        m2 += 1;
    }
    if (s < 10 and s2 < 10) drawText(string(m) + ":0" + string(s) + " / " + string(m2) + ":0" + string(s2),"small",  c_white, global.room_offset + 96, 64);
    else if (s < 10) drawText(string(m) + ":0" + string(s) + " / " + string(m2) + ":" + string(s2),"small",  c_white, global.room_offset + 96, 64);
    else if (s2 < 10) drawText(string(m) + ":" + string(s) + " / " + string(m2) + ":0" + string(s2),"small",  c_white, global.room_offset + 96, 64);
    else drawText(string(m) + ":" + string(s) + " / " + string(m2) + ":" + string(s2),"small",  c_white, global.room_offset + 96, 64);
}

if (drawLoot == 2)
{
    if (not isKills)
    {
		drawText(tr("NONE"),"small", c_white, global.room_offset + 96, 96)
    }
	drawText(tr("$") + string(moneyCount) + " / " + tr("$") + string(global.money),"small",  c_white, global.room_offset + 96, 112);
}