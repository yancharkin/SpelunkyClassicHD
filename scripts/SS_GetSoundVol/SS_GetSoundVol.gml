function SS_GetSoundVol(argument0) {
	return false;
	//Get the volume of a sound

	/*
	argument0: Sound handle as returned by LoadSound
	*/

	/*
	return: volume as real or -1 if there was an error (ie. the sound
	doesn't exist). See the script SS_SetSoundVol for valid volume range
	*/

	if is_real(argument0) then return "-1";
	return real(external_call(global.dll_SS_GetSoundVol, argument0))+10000;



}
