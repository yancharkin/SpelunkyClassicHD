if (global.music and not SS_IsSoundPlaying(argument0))
{
    if (argument1){
        //show_debug_message("playing");
        SS_LoopMusic(argument0); //LoopSound
    }else{
        SS_LoopMusic(argument0); //PlaySound
    }
}else{
    //show_debug_message("ALREADY playing");
}
