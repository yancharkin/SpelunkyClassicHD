function rand(argument0, argument1) {
	randNum = argument1 - argument0 + 1;
	return floor(random(randNum)) + argument0;
}
