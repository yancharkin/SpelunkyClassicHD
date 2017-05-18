sound_volume(argument0,argument1/10000)

//return false;
//Set the volume of a sound

/*
argument0: Sound handle as returned by LoadSound
argument1: Volume as real or string. 0 is muted, 10 000 is full volume.
*/

/*
return: "0" as string for failure and "1" as string for success.
*/
/*
if is_real(argument0) then return "0";
if is_string(argument1) then begin
  return external_call(global.dll_SS_SetSoundVol,
                       argument0,
                       string(real(argument1)-10000)
  );
end else begin
  return external_call(global.dll_SS_SetSoundVol,
                       argument0,
                       string(argument1-10000)
  );
end;

