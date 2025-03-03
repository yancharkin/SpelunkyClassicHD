function SS_PauseSound(argument0) {
	return false;


	//Pause a playing sound

	/*
	argument0: Sound handle as returned by LoadSound
	*/

	/*
	return: nothing
	*/



	if is_real(argument0) then return -1;
	return real(external_call(global.dll_SS_PauseSound,argument0));









}
