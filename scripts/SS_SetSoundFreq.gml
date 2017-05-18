return false;
//Set the frequency of a sound (in Hz)

/*
argument0: Sound handle as returned by LoadSound
argument1: Hz as real or string. Valid values are from 1000 Hz to 100 000 Hz
*/

/*
return: "0" as string for failure and "1" as string for success.
*/

/*if is_real(argument0) then return "0";
if is_string(argument1) then begin
  return external_call(global.dll_SS_SetSoundFreq,argument0,argument1);
end else begin
  return external_call(global.dll_SS_SetSoundFreq,argument0,string(argument1));
end;
