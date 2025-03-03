if (facing == RIGHT) image_xscale = -1;
else image_xscale = 1;

if ((sprite_index == sPExit or sprite_index == sDamselExit or sprite_index == sTunnelExit) and global.hasJetpack)
{
    draw_sprite_ext(sprite_index, -1, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
    draw_sprite(sJetpackBack,-1,x,y);
}
else if (sprite_index == sPExit or sprite_index == sDamselExit or sprite_index == sTunnelExit)
{
    draw_sprite_ext(sprite_index, -1, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
}
else if (global.hasJetpack)
{
    draw_sprite(sJetpackRight,-1,x-4,y-1);
}

if (sprite_index != sPExit and sprite_index != sDamselExit and sprite_index != sTunnelExit)
{
    draw_sprite_ext(sprite_index, -1, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
    if (global.pickupItem == "Rock") draw_sprite(sRock,-1,x+4,y+2);
    else if (global.pickupItem == "Jar") draw_sprite(sJar,-1,x+4,y+2);
    else if (global.pickupItem == "Skull") draw_sprite(sSkull,-1,x+4,y+2);
    else if (global.pickupItem == "Fish Bone") draw_sprite(sFishBone,-1,x+4,y+2);
    else if (global.pickupItem == "Arrow") draw_sprite(sArrowRight,-1,x+4,y+2);
    else if (global.pickupItem == "Rock") draw_sprite(sRock,-1,x+4,y+2);
    else if (global.pickupItem == "Machete") draw_sprite(sMacheteRight,-1,x+4,y+2);
    else if (global.pickupItem == "Mattock") draw_sprite(sMattockRight,-1,x+4,y+2);
    else if (global.pickupItem == "Mattock Head") draw_sprite(sMattockHead,-1,x+4,y+2);
    else if (global.pickupItem == "Pistol") draw_sprite(sPistolRight,-1,x+4,y+2);
    else if (global.pickupItem == "Web Cannon") draw_sprite(sWebCannonR,-1,x+4,y+2);
    else if (global.pickupItem == "Teleporter") draw_sprite(sTeleporter,-1,x+4,y+2);
    else if (global.pickupItem == "Shotgun") draw_sprite(sShotgunRight,-1,x+4,y+2);
    else if (global.pickupItem == "Bow") draw_sprite(sBowRight,-1,x+4,y+2);
    else if (global.pickupItem == "Flare") draw_sprite(sFlare,-1,x+4,y+2);
    else if (global.pickupItem == "Sceptre") draw_sprite(sSceptreRight,-1,x+4,y+2);
    else if (global.pickupItem == "Key") draw_sprite(sKeyRight,-1,x+4,y+2);
}

