if (not instance_exists(oBall))
{
    instance_destroy();
}
else
{
    x = oBall.x + ((oPlayer1.x-oBall.x)/4)*linkVal;
    y = oBall.y + ((oPlayer1.y-oBall.y)/4)*linkVal;
}
