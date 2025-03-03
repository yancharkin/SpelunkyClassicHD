//if(os_browser==browser_not_a_browser) return 0;

if os_browser!=browser_not_a_browser && browser_height!=browser_height_previous
{
    //var ht,ngw,ngh;
    //ht=browser_height;
    
    //if game_hgt>ht {ngw=floor(game_wid*(ht/game_hgt));ngh=ht} 
    //else {ngw=game_wid;ngh=game_hgt}
    
    //window_set_size(ngw,ngh)
    
    window_set_size(browser_height*(game_wid/game_hgt),browser_height)
}

sound_global_volume(soundson)

browser_height_previous=browser_height


