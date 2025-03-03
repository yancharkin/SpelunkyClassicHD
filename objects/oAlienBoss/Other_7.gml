if (sprite_index == sAlienBossDie)
{
    sprite_index = sAlienBossDead;
    with oBarrierEmitter { instance_destroy(); }
}
if (sprite_index == sAlienBossHurt)
{
    sprite_index = sAlienBoss;
}
