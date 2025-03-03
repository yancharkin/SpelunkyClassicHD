function SS_GetSoundBytesPerSecond(argument0) {
	return false;
	//Sets the current position in bytes

	/*
	argument0: sound handle as returned by SS_LoadSound
	*/

	/*
	return: 0 as real if unsuccessful, BPS as real if successful
	*/

	if is_real(argument0) then return 0;
	return real(external_call(global.dll_SS_GetSoundBytesPerSecond, argument0));



}
