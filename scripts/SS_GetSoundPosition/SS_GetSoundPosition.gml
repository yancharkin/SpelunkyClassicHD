function SS_GetSoundPosition(argument0) {
	return false;
	//Gets the current position in bytes

	/*
	argument0: sound handle as returned by SS_LoadSound
	*/

	/*
	return: the current position in bytes as real or an error
	code less than 0 as real if there was an error (like the
	sound doesn't exist)
	*/

	if is_real(argument0) then return -1;
	return real(external_call(global.dll_SS_GetSoundPosition,argument0));



}
