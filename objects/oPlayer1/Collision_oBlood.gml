if (global.hasKapala and other.collectible)
{
    global.bloodLevel += 1;
    instance_create(other.x, other.y, oBloodSpark);
    with other { instance_destroy(); }
    
    if (global.bloodLevel > 8)
    {
        global.bloodLevel = 0;
        global.plife += 1;
        instance_create(x, y-8, oHeart);
        playSound(global.sndKiss);
    }
    
    if (redColor < 55) redColor += 5;
    redToggle = false;
}
