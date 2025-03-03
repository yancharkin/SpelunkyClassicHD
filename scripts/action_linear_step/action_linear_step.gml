/// @description (Old DnD) - linear step
/// @param x	x position 
/// @param y	y position 
/// @param speed	speed
/// @param checkall	true if checking all
function action_linear_step(argument0, argument1, argument2, argument3) {

	var xx = argument0;
	var yy = argument1;
	if (global.__argument_relative) {
		xx += x;
		yy += y;
	}  // end if
	mp_linear_step( xx, yy, argument2, argument3 );


}
