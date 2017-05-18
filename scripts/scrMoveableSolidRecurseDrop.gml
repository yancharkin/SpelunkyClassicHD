var obj;
obj = instance_place(x, y-1, oMoveableSolid);
if (obj)
{
    with obj
    {
        scrMoveableSolidRecurseDrop();
        y += 0.05;
    }
}
