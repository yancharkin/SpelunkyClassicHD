hp -= other.damage;
countsAsKill = true;
if (bloodLeft > 0)
{
    scrCreateBlood(x+sprite_width/2, y+sprite_height/2, 1);
    if (hp < 0) bloodLeft -= 1;
}
playSound(global.sndHit);

