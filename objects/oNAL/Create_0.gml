
globalvar browser_height_previous,game_wid,game_hgt,soundson;

browser_height_previous=browser_height

game_wid=960 
game_hgt=720

soundson=1


// If we ARE in a browser... do the below...
/*if os_browser!=browser_not_a_browser
{
    var ht,ngw,ngh;
    ht=browser_height;
    
    if game_hgt>ht {ngw=floor(game_wid*(ht/game_hgt));ngh=ht} 
    else {ngw=game_wid;ngh=game_hgt}
    
    window_set_size(ngw,ngh)
}
*/
keyboard_set_map(ord("Y"), ord("Z"));

for (var i = 0; i < 4; i++;)
{
    if gamepad_is_connected(i)
    {
        show_debug_message("Gamepad connected: " + string(gamepad_get_description(i)));
    }
}

room_goto_next()
instance_destroy();

/* */
/*  */
