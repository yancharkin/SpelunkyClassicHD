/// @description checkJoyButton()
function checkJoyButton() {

	var __allowedbuttons = 0;
	__allowedbuttons[0] = gp_face1;
	__allowedbuttons[1] = gp_face2;
	__allowedbuttons[2] = gp_face3;
	__allowedbuttons[3] = gp_face4;
	__allowedbuttons[4] = gp_start;
	__allowedbuttons[5] = gp_select;
	__allowedbuttons[6] = gp_stickl;
	__allowedbuttons[7] = gp_stickr;
	__allowedbuttons[8] = gp_shoulderl;
	__allowedbuttons[9] = gp_shoulderr;
	__allowedbuttons[10] = gp_padl;
	__allowedbuttons[11] = gp_padr;
	__allowedbuttons[12] = gp_padu;
	__allowedbuttons[13] = gp_padd;
	//analogue triggers are handled separately
	// looks like on Linux sometimes buttons are messed up, so here is a hack:
	if (os_type == os_linux) {
		__allowedbuttons[14] = gp_shoulderlb;
		__allowedbuttons[15] = gp_shoulderrb;
	}  else {	
		if (gamepad_button_value(global.joyid, gp_shoulderlb) > 0.6)
		    return gp_shoulderlb;
		if (gamepad_button_value(global.joyid, gp_shoulderrb) > 0.6)
		    return gp_shoulderlb;
	}

	for (var i = 0; i < array_length_1d(__allowedbuttons); i++)
	{
	    var _btn = __allowedbuttons[i];
	    if (gamepad_button_check(global.joyid, _btn))
	        return _btn;
	}
	
	__allowedbuttons = 0; // free the array.
	return 0;

}
