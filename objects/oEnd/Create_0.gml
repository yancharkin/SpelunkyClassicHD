shakeToggle = false;
oPDummy.status = 2;

timer = 0;

if (global.kaliPunish >= 2)
{
    instance_create(oPDummy.x, oPDummy.y+2, oBall2);
    obj = instance_create(oPDummy.x, oPDummy.y, oChain2);
    obj.linkVal = 1;
    obj = instance_create(oPDummy.x, oPDummy.y, oChain2);
    obj.linkVal = 2;
    obj = instance_create(oPDummy.x, oPDummy.y, oChain2);
    obj.linkVal = 3;
    obj = instance_create(oPDummy.x, oPDummy.y, oChain2);
    obj.linkVal = 4;
}

stopAllMusic();