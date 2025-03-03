if( (!surface_exists(surf)) || (surf_width!=__view_get( e__VW.WPort, 0 )) || (surf_height!=__view_get( e__VW.HPort, 0 )) )
{
    if( surface_exists(surf) ){
        surface_free(surf);
        surf=-1;
    }
 
    surf_width=__view_get( e__VW.WPort, 0 );
    surf_height=__view_get( e__VW.HPort, 0 );
    surf = surface_create( surf_width, surf_height );
}
__view_set( e__VW.SurfaceID, 0, surf );

//if( print){
//    show_debug_message("yyScreen="+string(count++) );
//}

