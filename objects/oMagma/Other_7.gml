if (dying)
{
    magma = instance_create(x-8, y-8, oMagmaMan);
    magma.hp = hp;
    instance_destroy();
}
