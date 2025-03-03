function SS_ResumeSound(argument0) {
	return false;
	//Resume a paused sound
	//If the sound was stopped it will start playing from the start.
	//If the sound is already playng it will simply continue playing

	/*
	argument0: Sound handle as returned by LoadSound
	*/

	/*
	return: 1 for success, 0 for failure
	*/

	if is_real(argument0) then return -1;
	return real(external_call(global.dll_SS_ResumeSound,argument0));



}
