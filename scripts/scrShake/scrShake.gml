function scrShake(argument0) {
	//
	// scrShake(duration)
	//
	// Shake the screen.
	//

	if (global.shake < argument0) global.shake = argument0;
	if (global.shake < 0) global.shake = 0;
	global.xview = __view_get( e__VW.XView, 0 );
	global.yview = __view_get( e__VW.YView, 0 );



}
