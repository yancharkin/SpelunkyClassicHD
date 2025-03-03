function SS_GetSoundPan(argument0) {
	return false;
	//Get the current panning of a sound

	/*
	argument0: Sound handle as returned by LoadSound
	*/

	/*
	return: panning as real
	See the script SS_SetSoundPan for valid range
	*/

	if is_real(argument0) then return "0";
	return real(external_call(global.dll_SS_GetSoundPan, argument0));



}
