if (instance_exists(oPDummy))
{
    x = oBall2.x + ((oPDummy.x-oBall2.x)/4)*linkVal;
    y = oBall2.y + ((oPDummy.y-oBall2.y)/4)*linkVal;
}
else 
{
    x = oBall2.x + ((280-oBall2.x)/4)*linkVal;
    y = oBall2.y + ((184-oBall2.y)/4)*linkVal;
}
