__background_set( e__BG.XScale, 0, room_width/960 )
__background_set( e__BG.YScale, 0, room_height/720 )

var aladj=alarm[0]*(60/room_speed)

draw_background_stretched(bGameMakerIntroBack,0,0,room_width,room_height)

with(oGameMakerLogoPoof) draw_self()

if aladj>=0
{
    sc=0.1+(power(aladj,0.5)*0.06)
    
    image_alpha=power(1-(aladj/20),3)
    image_angle=aladj*2
    
    image_xscale=sc
    image_yscale=sc
    
    if aladj<room_speed/5 && !instance_exists(oGameMakerLogoPoof) instance_create(x,y,oGameMakerLogoPoof)
    
    for(i=0;i<=3;i++)
    {
        draw_sprite_ext(/*cogbit[i]*/sGameMakerLogoCog3,0,
                  /*x*/ x+lengthdir_x(power(aladj,0.5)*60,(i*90)-(75*(aladj/20))),
                  /*y*/ y+lengthdir_y(power(aladj,0.5)*60,(i*90)-(75*(aladj/20))),
             /*xscale*/ sc,
             /*yscale*/ sc,
                /*rot*/ (i*90)-(aladj*2),
             /*colour*/ c_white,
              /*alpha*/ image_alpha)
    }
    
    draw_self()
}

else
{
    sc=lerp(sc,0.135,gmitf(0.07)) //min(sc+gmitf(0.001),0.135)
    
    image_alpha=1
    image_angle=aladj*2
    
    image_xscale=sc
    image_yscale=sc
    
    for(i=0;i<=3;i++)
    {
        draw_sprite_ext(cogbit[i],0,x,y,sc,sc,0,c_white,1)
    }
    
    draw_self()    
}

x=room_width/2
y=room_height*0.45

/* */
/*  */
