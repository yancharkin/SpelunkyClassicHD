/// @description Sets a view and its related attributes of a given room.
/// @param ind The index of the room to set the view of.
/// @param vind The view 'slot' to set, between 0 and 7.
/// @param vis Whether the view is visible (true) or not (false).
/// @param xview The x position of the left of the area the view captures.
/// @param yview The y position of the top of the area the view captures.
/// @param wview The width of the area the view captures.
/// @param hview The height of the area the view captures.
/// @param xport The x position of the left of the area the view occupies on-screen.
/// @param yport The y position of the top of the area the view occupies on-screen.
/// @param wport The width of the area the view occupies on-screen.
/// @param hport The height of the area the view occupies on-screen.
/// @param hborder The minimum horizontal space between the edge of the view and the object it is set to follow (before the view begins moving and if it is set to follow an object).
/// @param vborder The minimum vertical space between the edge of the view and the object it is set to follow (before the view begins moving and if it is set to follow an object).
/// @param hspeed The maximum horizontal speed the view can move at.
/// @param vspeed The maximum vertical speed the view can move at.
/// @param obj The object or instance to follow. -1 to disable object following.
function room_set_view(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8, argument9, argument10, argument11, argument12, argument13, argument14, argument15) {

	var __ind = argument0;
	var __vind = argument1;
	var __vis = argument2;
	var __xview = argument3;
	var __yview = argument4;
	var __wview = argument5;
	var __hview = argument6;
	var __xport = argument7;
	var __yport = argument8;
	var __wport = argument9;
	var __hport = argument10;
	var __hborder = argument11;
	var __vborder = argument12;
	var __hspeed = argument13;
	var __vspeed = argument14;
	var __obj = argument15;

	if (!room_exists(__ind))
	{
		show_debug_message("room_set_view: room " + string(__ind) + " does not exist");
		return -1;
	}

	if ((__vind < 0) || (__vind > 7))
	{
		show_debug_message("room_set_view: view index out of range");
		return -1;
	}

	// Create new camera with specified params
	var __newcam = camera_create_view(__xview, __yview, __wview, __hview, 0, __obj, __hspeed, __vspeed, __hborder, __vborder);

	// Get existing camera in room
	var __currcam = room_get_camera(__ind, __vind);
	if (__currcam != -1)
	{
		// destroy it so we don't leave it in limbo
		camera_destroy(__currcam);
	}

	room_set_camera(__ind, __vind, __newcam);

	room_set_viewport(__ind, __vind, __vis, __xport, __yport, __wport, __hport);

	return -1;


}
