function SS_IsSoundLooping(argument0) {
	return false;
	//Check if the specified playing sound is set to loop

	/*
	argument0: sound handle as returned by SS_LoadSound
	*/

	/*
	return: true/false/-1 as real
	-1 if sound doesn't exist or there was another error
	*/

	if is_real(argument0) then return -1;
	return real(external_call(global.dll_SS_IsSoundLooping,argument0));






}
