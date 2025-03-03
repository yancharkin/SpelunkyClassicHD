function highscore_add2(argument0, argument1, argument2) {
	ini_write_string("highscore", "name"+string(argument0),argument1)
	ini_write_real(  "highscore","value"+string(argument0),argument2)



}
