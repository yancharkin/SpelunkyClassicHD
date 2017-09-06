scale_level = global.display_h / 240;
vkey_size = 32 * scale_level;

// Left
virtual_key_add(0, global.display_h - (2*vkey_size), vkey_size, vkey_size, vk_left);
// Up + Left
virtual_key_add(0, global.display_h - (3*vkey_size), vkey_size, vkey_size, vk_left);
virtual_key_add(0, global.display_h - (3*vkey_size), vkey_size, vkey_size, vk_up);
// Up
virtual_key_add(vkey_size, global.display_h - (3*vkey_size), vkey_size, vkey_size, vk_up);
// Up + Right
virtual_key_add(2*vkey_size, global.display_h - (3*vkey_size), vkey_size, vkey_size, vk_right);
virtual_key_add(2*vkey_size, global.display_h - (3*vkey_size), vkey_size, vkey_size, vk_up);
// Right
virtual_key_add(2*vkey_size, global.display_h - (2*vkey_size), vkey_size, vkey_size, vk_right);
// Down + Right
virtual_key_add(2*vkey_size, global.display_h - vkey_size, vkey_size, vkey_size, vk_right);
virtual_key_add(2*vkey_size, global.display_h - vkey_size, vkey_size, vkey_size, vk_down);
// Down
virtual_key_add(vkey_size, global.display_h - vkey_size, vkey_size, vkey_size, vk_down);
// Down + left
virtual_key_add(0, global.display_h - vkey_size, vkey_size, vkey_size, vk_left);
virtual_key_add(0, global.display_h - vkey_size, vkey_size, vkey_size, vk_down);
// Jump
virtual_key_add(global.display_w - vkey_size, global.display_h - vkey_size, vkey_size, vkey_size, ord('Z'));
// Run
virtual_key_add(global.display_w - vkey_size, global.display_h - (2.5*vkey_size), vkey_size, vkey_size, vk_shift);
// Run + Jump
//virtual_key_add(global.display_w - vkey_size, global.display_h - (1.5*vkey_size), vkey_size, vkey_size/2, ord('Z'));
//virtual_key_add(global.display_w - vkey_size, global.display_h - (1.5*vkey_size), vkey_size, vkey_size/2, vk_shift);
// Switch
virtual_key_add(global.display_w - (2.5*vkey_size), global.display_h - (2.5*vkey_size), vkey_size, vkey_size, ord('C'));
// Action
virtual_key_add(global.display_w - (2.5*vkey_size), global.display_h - vkey_size, vkey_size, vkey_size, ord('X'));
// Pause
virtual_key_add(global.display_w - vkey_size, 0, vkey_size, vkey_size, vk_escape);
// Hide touch controls
virtual_key_add(global.display_w - 2*vkey_size, 0, vkey_size, vkey_size, ord('F'));
// Purchase
virtual_key_add(global.display_w - vkey_size, vkey_size, vkey_size, vkey_size, ord('P'));
// Rope
virtual_key_add(global.display_w - vkey_size, 2*vkey_size, vkey_size, vkey_size, ord('S'));
// Bomb
virtual_key_add(global.display_w - vkey_size, 3*vkey_size, vkey_size, vkey_size, ord('A'));

if (global.touchControlsVisible == 1)
{
    draw_sprite(TouchArrowsSemiTr, -1, 0, global.display_h - (3*vkey_size));
    draw_sprite(TouchButtons1SemiTr, -1, global.display_w - (2.5*vkey_size), global.display_h - (2.5*vkey_size));
    draw_sprite(TouchButtons2SemiTr, -1, global.display_w - 2*vkey_size, 0);
}
else if (global.touchControlsVisible == 2)
{
    draw_sprite(TouchArrowsOp, -1, 0, global.display_h - (3*vkey_size));
    draw_sprite(TouchButtons1Op, -1, global.display_w - (2.5*vkey_size), global.display_h - (2.5*vkey_size));
    draw_sprite(TouchButtons2Op, -1, global.display_w - 2*vkey_size, 0);
}
else if (global.touchControlsVisible == 0)
{
    return 0;
}
