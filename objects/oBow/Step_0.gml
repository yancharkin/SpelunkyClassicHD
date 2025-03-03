action_inherited();
if (held)
{
    if (oPlayer1.facing == 18) sprite_index = sBowLeft;
    else sprite_index = sBowRight;
/*
    if (checkLeft() and not checkRight()) sprite_index = sBowLeft;
    if (checkRight() and not checkLeft()) sprite_index = sBowRight;
*/    
    if (oPlayer1.bowStrength >= 10) image_index = 3;
    else if (oPlayer1.bowStrength > 6) image_index = 2;
    else if (oPlayer1.bowStrength > 2) image_index = 1;
    else image_index = 0;
}
else
{
    image_index = 0;
}

/* */
/*  */
