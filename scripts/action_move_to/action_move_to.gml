/// @description (Old DnD) - move to
/// @param x	x position 
/// @param y	y position 
function action_move_to(argument0, argument1) {

	var xx = argument0;
	var yy = argument1;
	if (global.__argument_relative) {
		xx += x;
		yy += y;
	}  // end if
	x = xx;
	y = yy;


}
