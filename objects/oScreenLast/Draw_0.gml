with(oScreen)
{

    global.pSurf2=0
    
    if (not surface_exists(pSurf)) pSurf = surface_create(global.display_w, global.display_h);
    if (not surface_exists(screen)) screen = surface_create(global.display_w, global.display_h);
    if (not surface_exists(darkSurf)) darkSurf = surface_create(global.display_w, global.display_h);
        
    if (checkStartPressed())
    {
        if (not paused and canPause)
        {
            if (instance_exists(oPlayer1))
            {
                if (not oPlayer1.dead)
                {
                    surface_set_target(pSurf);
                    
                    if (global.darkLevel) draw_set_alpha(1);
                    else draw_set_alpha(0.9);
                    draw_set_color(c_black);
                    draw_rectangle(0, 0, global.display_w, global.display_h, false);
                    draw_set_alpha(1);
                    if (SS_IsSoundPlaying(global.musTitle)) SS_SetSoundVol(global.musTitle, 0);
                    if (SS_IsSoundPlaying(global.musCave)) SS_SetSoundVol(global.musCave, 0);
                    if (SS_IsSoundPlaying(global.musLush)) SS_SetSoundVol(global.musLush, 0);
                    if (SS_IsSoundPlaying(global.musIce)) SS_SetSoundVol(global.musIce, 0);
                    if (SS_IsSoundPlaying(global.musTemple)) SS_SetSoundVol(global.musTemple, 0);
                    if (SS_IsSoundPlaying(global.musBoss)) SS_SetSoundVol(global.musBoss, 0);
                    py = oPlayer1.y;
                    
                    with(all)
                    {
                        if object_index!=oGamepad
                        && object_index!=oNAL
                        && object_index!=oScreenFirst
                        && object_index!=oScreenLast
                        && object_index!=oScreen
                        && object_index!=yyScreen
                        {
                            instance_deactivate_object(id)
                        }
                    }
                    
                    draw_set_font(global.fontLarge);
                    draw_set_color(c_white);
                    draw_text(112, 200, string_hash_to_newline(tr("PAUSED")));
                    draw_set_font(global.fontSmall);
                    if (isLevel())
                    {
                        n = 128-24;
                        if (global.currLevel < 1) draw_text(40, n-24, string_hash_to_newline(tr("TUTORIAL CAVE")));
                        else if (isRoom("rLoadLevel")) draw_text(40, n-24, string_hash_to_newline(tr("LEVEL: ") + global.customLevelName + tr(" BY ") + global.customLevelAuthor));
                        else draw_text(40, n-24, string_hash_to_newline(tr("LEVEL ") + string(global.currLevel)));
                        draw_text(40, n-16, string_hash_to_newline(tr("DEPTH: ") + string(174.8*(global.currLevel-1)+(py+8)*0.34) + tr(" FEET")));
                        draw_text(40, n, string_hash_to_newline(tr("MONEY:  ") + string(global.money)));
                        draw_text(40, n+8, string_hash_to_newline(tr("KILLS:  ") + string(global.kills)));
                        s = global.xtime;
                        s = floor(s / 1000);
                        m = 0;
                        while (s > 59)
                        {
                            s -= 60;
                            m += 1;
                        }
                        if (s < 10) str = "0" + string(s);
                        else str = string(s);
                        s2 = global.time;
                        s2 = floor(s2 / 1000);
                        m2 = 0;
                        while (s2 > 59)
                        {
                            s2 -= 60;
                            m2 += 1;
                        }
                        if (s2 < 10) str2 = "0" + string(s2);
                        else str2 = string(s2);
                        draw_text(40, n+16, string_hash_to_newline(tr("TIME:  ") + string(m) + ":" + str + " / " + string(m2) + ":" + str2));
                        draw_text(40, n+24, string_hash_to_newline(tr("SAVES:  ") + string(global.damsels)));
                        if (global.gamepadOn) draw_text(24, 216, string_hash_to_newline(tr("START-RETURN  BOMB-DIE  ROPE-QUIT/RESET")));
                        else draw_text(40, 216, string_hash_to_newline(tr("ESC-RETURN  F1-DIE  F9-QUIT/RESET")));
                    }
                    else
                    {
                        if (global.gamepadOn) draw_text(64, 216, string_hash_to_newline(tr("START-RETURN  ROPE-QUIT/RESET")));
                        else draw_text(80, 216, string_hash_to_newline(tr("ESC-RETURN  F9-QUIT/RESET")));
                    }
                    
                    surface_reset_target();
                    
                    global.pSurf2 = 1;
                    paused = true;
                }
            }
        }
        else
        {
            global.pSurf2=0
            
            instance_activate_all();
            if (SS_IsSoundPlaying(global.musTitle)) SS_SetSoundVol(global.musTitle, 2000 + 8000 * (global.musicVol/18));
            if (SS_IsSoundPlaying(global.musCave)) SS_SetSoundVol(global.musCave, 2000 + 8000 * (global.musicVol/18));
            if (SS_IsSoundPlaying(global.musLush)) SS_SetSoundVol(global.musLush, 2000 + 8000 * (global.musicVol/18));
            if (SS_IsSoundPlaying(global.musIce)) SS_SetSoundVol(global.musIce, 2000 + 8000 * (global.musicVol/18));
            if (SS_IsSoundPlaying(global.musTemple)) SS_SetSoundVol(global.musTemple, 2000 + 8000 * (global.musicVol/18));
            if (SS_IsSoundPlaying(global.musBoss)) SS_SetSoundVol(global.musBoss, 2000 + 8000 * (global.musicVol/18));
            paused = false;
        }
    
    }
    
    // this draws the surface on the screen
    //surface_reset_target();
    
    if (paused)
    {
        global.pSurf2=1
    }
}

