//
// isInShop(x, y)
//
// Is this point (x, y) in a shop?
//

tx = argument0;
ty = argument1;

if (global.roomPath[scrGetRoomX(tx), scrGetRoomY(ty)] == 4 or global.roomPath[scrGetRoomX(tx), scrGetRoomY(ty)] == 5)
    return true;

return false;
