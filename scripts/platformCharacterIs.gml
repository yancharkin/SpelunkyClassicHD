/*
Returns whether a GENERAL trait about a character is true.
Only the platform character should run this script. 

argument0 can be one of the following:
ON_GROUND
IN_AIR
ON_LADDER

Example of usage:
Event: oCharacter collides with oGoomba
Action: if platformCharacterIs(ON_GROUND) instance_destroy()
*/

if (argument0=ON_GROUND) and (state=RUNNING or state=STANDING or state=DUCKING or state=LOOKING_UP)
  return 1
if (argument0=IN_AIR) and (state=JUMPING or state=FALLING)
  return 1
if (argument0=ON_LADDER) and (state=CLIMBING)
  return 1
return 0
