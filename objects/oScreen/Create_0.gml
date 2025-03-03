scrReadStats();
scrInit();
instance_destroy();

py = 0; // player Y coord

// screen
screen_x = 0;
screen_y = 0;
screen_w = display_get_width();
screen_h = display_get_height();
enabled = true;

// pause
pSurf = -1 surface_create(screen_w,screen_h);
canPause = true;
paused = false;

// create a surface for the whole screen to be drawn on
screen = -1; //surface_create(screen_w,screen_h);
darkSurf = surface_create(screen_w,screen_h);

// use all screen space if possible
h = 240;
global.screenAspectRatio = (screen_w/screen_h);
if ((global.screenAspectRatio >= 1.333333333) and (global.screenAspectRatio <= 1.875)) {
    w = round(240 * global.screenAspectRatio);
    global.touchCorrectionH = 0;
    global.touchCorrectionV = 0;
} else {
    if (global.screenAspectRatio > 1.875) {
        w = 450;
        global.touchCorrectionH = ((w - 320)/8);
        global.touchCorrectionV = 0;
    } else if (global.screenAspectRatio < 1.333333333) {
        w = 320;
        global.touchCorrectionH = 0;
        global.touchCorrectionV = ((screen_h - 240)/10);
    }
}

// set up rooms
global.room_offset = ((w - 320)/2);
room_set_view(rIntro,0,true,0,0,w,h,0,0,w,h,w/2,0,-1,-1,oPDummy3);
room_set_view(rCredits1,0,true,0,0,w,h,0,0,w,h,0,0,0,0,noone);
room_set_view(rCredits2,0,true,0,0,w,h,0,0,w,h,0,0,0,0,noone);
room_set_view(rTitle,0,true,0,0,w,h,0,0,w,h,0,0,0,0,noone);
room_set_view(rHighscores,0,true,-global.room_offset,0,w,h,-global.room_offset,0,w,h,0,0,0,0,noone);
room_set_view(rSun,0,true,-global.room_offset,0,w,h,-global.room_offset,0,w,h,0,0,0,0,noone);
room_set_view(rMoon,0,true,-global.room_offset,0,w,h,-global.room_offset,0,w,h,0,0,0,0,noone);
room_set_view(rStars,0,true,-global.room_offset,0,w,h,-global.room_offset,0,w,h,0,0,0,0,noone);
room_set_view(rLevelEditor,0,true,0,0,w,h,0,0,w,h,0,0,-1,-1,noone);
room_set_view(rLoadLevel,0,true,0,0,w,h,0,0,w,h,w/2,96,-1,-1,oPlayer1);
room_set_view(rTutorial,0,true,0,0,w,h,0,0,w,h,w/2,96,-1,-1,oPlayer1);
room_set_view(rLevel,0,true,0,0,w,h,0,0,w,h,w/2,96,-1,-1,oPlayer1);
room_set_view(rLevel2,0,true,0,0,w,h,0,0,w,h,w/2,96,-1,-1,oPlayer1);
room_set_view(rLevel3,0,true,0,0,w,h,0,0,w,h,w/2,96,-1,-1,oPlayer1);
room_set_view(rOlmec,0,true,0,0,w,h,0,0,w,h,w/2,96,-1,-1,oPlayer1);
room_set_view(rTransition1,0,true,-global.room_offset,0,w,h,-global.room_offset,0,w,h,0,0,0,0,noone);
room_set_view(rTransition1x,0,true,-global.room_offset,0,w,h,-global.room_offset,0,w,h,0,0,0,0,noone);
room_set_view(rTransition2,0,true,-global.room_offset,0,w,h,-global.room_offset,0,w,h,0,0,0,0,noone);
room_set_view(rTransition2x,0,true,-global.room_offset,0,w,h,-global.room_offset,0,w,h,0,0,0,0,noone);
room_set_view(rTransition3,0,true,-global.room_offset,0,w,h,-global.room_offset,0,w,h,0,0,0,0,noone);
room_set_view(rTransition3x,0,true,-global.room_offset,0,w,h,-global.room_offset,0,w,h,0,0,0,0,noone);
room_set_view(rTransition4,0,true,-global.room_offset,0,w,h,-global.room_offset,0,w,h,0,0,0,0,noone);
room_set_view(rEnd,0,true,0,0,w,h,0,0,w,h,0,0,0,0,oPDummy);
room_set_view(rEnd2,0,true,-2*global.room_offset,0,w,h,-2*global.room_offset,0,w,h,0,0,0,0,noone);
room_set_view(rEnd3,0,true,-global.room_offset,0,w,h,-global.room_offset,0,w,h,0,0,0,0,noone);
room_set_view(rEndCustom,0,true,-global.room_offset,0,w,h,-global.room_offset,0,w,h,0,0,0,0,noone);

conf_x = (w - 160)/2;
conf_y = (h - 120 - 32)/2;

room_set_view(rKeyConfig,0,true,-conf_x,-conf_y,w,h,-conf_x,-conf_y,w,h,0,0,0,0,noone);
room_set_view(rJoyConfig,0,true,-conf_x,-conf_y,w,h,-conf_x,-conf_y,w,h,0,0,0,0,noone);
room_set_view(rJoyConfigHtml5,0,true,-conf_x,-conf_y,w,h,-conf_x,-conf_y,w,h,0,0,0,0,noone);

window_set_size(screen_w, screen_h);
if (global.fullscreen){
    if (!global.html5Build) {
        window_set_size(screen_w, screen_h);
        window_set_fullscreen(true);
    } else {
        if (global.electronBuild) {
            newSize = electronSetFullscreen(true);
            window_set_size(newSize[0], newSize[1]);
        }
    }
}

if (!global.html5Build) {
    window_set_size(800, 800/global.screenAspectRatio);
}
surface_resize(application_surface, w, h);
__view_set( e__VW.WView, 0, w );
__view_set( e__VW.WPort, 0, w );
__view_set( e__VW.HView, 0, h );
__view_set( e__VW.HPort, 0, h );

global.display_w = w;
global.display_h = h;

room_goto_next();

action_reverse_xdir();
//action_path(-1, 0, 0, 0);
action_linear_step(0, 0, 0, 0);
action_linear_step(0, 0, 0, 0);
action_move_to(0, 0);
