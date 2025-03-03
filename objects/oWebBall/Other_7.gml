if (sprite_index == sWebCreate)
{
    obj = instance_create(x-8, y-8, oWeb);
    obj.dying = true;
    instance_destroy();
}
