for (i = 0; i < 3; i += 1)
{
    rubble = instance_create(other.x+rand(0,15)-rand(0,15), other.y+rand(0,15)-rand(0,15), oRubble);
    rubble.sprite_index = sRubbleTan;
    if (rand(1,3) == 1) instance_create(other.x+rand(0,15)-rand(0,15), other.y+rand(0,15)-rand(0,15), oRock);
}
for (i = 0; i < 6; i += 1)
{
    rubble = instance_create(other.x+rand(0,15)-rand(0,15), other.y+rand(0,15)-rand(0,15), oRubbleSmall);
    rubble.sprite_index = sRubbleTanSmall;
}

with other { instance_destroy(); }
