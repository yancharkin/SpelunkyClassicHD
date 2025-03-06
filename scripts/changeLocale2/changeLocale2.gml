/// @description changeLocale2
function changeLocale2() {

	var newLocaleIndex = 0;
	var localesN = array_length_1d(global.localesArray);
	for (var i = 0; i < localesN; i++;) {
	    if (global.localesArray[i] = global.locale2) {
	        newLocaleIndex = i + 1;
	        if (newLocaleIndex = localesN) {
	            newLocaleIndex = 0;
	        }
	    }
	}

	global.locale2 = global.localesArray[newLocaleIndex];
	if (global.locale2 == global.locale) changeLocale2();
	global.message = "";
	global.message2 = "";

}
