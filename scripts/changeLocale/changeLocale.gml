/// @description changeLocale
function changeLocale() {

	var newLocaleIndex = 0;
	var localesN = array_length_1d(global.localesArray);
	for (var i = 0; i < localesN; i++;) {
	    if (global.localesArray[i] = global.locale) {
	        newLocaleIndex = i + 1;
	        if (newLocaleIndex = localesN) {
	            newLocaleIndex = 0;
	        }
	    }
	}

	global.locale = global.localesArray[newLocaleIndex];
	global.message = "";
	global.message2 = "";



}
