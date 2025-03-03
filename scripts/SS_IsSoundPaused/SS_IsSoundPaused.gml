function SS_IsSoundPaused(argument0) {
	return false;
	//Check if the specified sound is currently paused

	/*
	argument0: sound handle as returned by SS_LoadSound
	*/

	/*
	return: true/false/-1
	*/


	if is_real(argument0) then return -1;
	return real(external_call(global.dll_SS_IsSoundPaused,argument0));





}
