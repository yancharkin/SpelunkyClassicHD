if (surface_exists(screen))
{
    surface_set_target(screen);
    draw_clear(0);
    surface_free(screen);
}
if (surface_exists(pSurf))
{
    surface_set_target(pSurf);
    draw_clear(0);
    surface_free(pSurf);
}
if (surface_exists(darkSurf))
{
    surface_set_target(darkSurf);
    draw_clear(0);
    surface_free(darkSurf);
}
stopAllMusic();
//SS_Unload();
//scrWriteStats();

