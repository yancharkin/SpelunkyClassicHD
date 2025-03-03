/// @description GameMaker Intro time fix
///Fixes any timing-based variables so they work correctly at non-60FPS FPSes
function gmitf(argument0) {

	return argument0*(60/room_speed);



}
