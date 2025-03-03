if (holdItem)
{
    if (state == CLIMBING and (global.hasJetpack or global.hasCape)) holdItem.depth = 51;
    else holdItem.depth = 0;
}

if (state == DUCKTOHANG and sprite_index != sDuckToHangL and sprite_index != sDamselDtHL and sprite_index != sTunnelDtHL)
{
    state = STANDING;
}

