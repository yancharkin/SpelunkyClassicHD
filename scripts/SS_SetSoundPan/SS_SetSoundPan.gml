function SS_SetSoundPan(argument0, argument1) {
	return false;
	//Set the panning of a sound

	/*
	argument0: Sound handle as returned by LoadSound
	argument1: Pan as real or string. -10 000 is full left
	                                   10 000 is full right
	                                   0 is centred
	*/

	/*
	return: "0" as string for failure and "1" as string for success.
	*/

	if is_real(argument0) then return "0";
	if is_string(argument1) then begin
	  return external_call(global.dll_SS_SetSoundPan,argument0,argument1);
	end else begin
	  return external_call(global.dll_SS_SetSoundPan,argument0,string(argument1));
	end;



}
