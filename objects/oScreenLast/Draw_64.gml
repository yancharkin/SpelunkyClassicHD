return -1;
with(oScreen)
{
    var scwidth=browser_height*(960/720)
    var scheight=browser_height
    
    /*if global.drawscreen
    {
        draw_surface_stretched(screen,screen_x,screen_y,scwidth,scheight);
    }*/
    if global.pSurf2
    {
        draw_clear(0)
        draw_surface_stretched(pSurf,screen_x,screen_y,window_get_width(),window_get_height());
        //global.drawpSurf=1
        //draw_surface_stretched(pSurf,screen_x,screen_y,scwidth,scheight);
    }
    /*if global.drawdarkSurf
    {
        draw_surface_stretched(darkSurf,screen_x,screen_y,scwidth,scheight);
    }*/
}

/* */
/*  */
