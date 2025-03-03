function SS_SetSoundPosition(argument0, argument1) {
	return false;
	//Sets the current position in bytes

	/*
	argument0: sound handle as returned by SS_LoadSound
	argument1: new sound position in bytes as real
	*/

	/*
	return: 0 as real if unsuccessful, 1 as real if successful
	*/

	if is_real(argument0) then return 0;
	if is_string(argument1) then return 0;
	return real(external_call(global.dll_SS_SetSoundPosition,argument0,string(argument1)))+1;



}
