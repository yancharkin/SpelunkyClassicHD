function SS_IsHandleValid(argument0) {
	return false;
	//Check if the specified sound handle is a valid sound handle
	//This function is bulletproof and can be used with any value

	/*
	argument0: sound handle
	*/

	/*
	return: true/false
	*/

	if is_real(argument0) then return -1;
	switch external_call(global.dll_SS_IsSoundPlaying,argument0) begin
	  case "1":   return 1;
	  case "0":    return 1;
	  case "-1": return 0;
	end;



}
