function SS_GetSoundLength(argument0) {
	return false;
	//Gets the length in bytes

	/*
	argument0: sound handle as returned by SS_LoadSound
	*/

	/*
	return: an error code less than 0 as real if unsuccessful,
	the length in bytes as real if successful.
	*/

	if is_real(argument0) then return 0;
	return real(external_call(global.dll_SS_GetSoundLength,argument0));



}
