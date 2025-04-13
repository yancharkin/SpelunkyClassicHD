/// @description changeLocale
function changeLocale() {

	var newLocaleIndex = 0;
	var localesN = array_length(global.localesArray);
	for (var i = 0; i < localesN; i++;) {
	    if (global.localesArray[i] = global.locale) {
	        newLocaleIndex = i + global.localeChangeBy;
	        if (newLocaleIndex = localesN) {
	            newLocaleIndex = 0;
	        }
			if (newLocaleIndex < 0) {
	            newLocaleIndex = localesN-1;
	        }
	    }
	}

	global.locale = global.localesArray[newLocaleIndex];
	if (global.locale2 == global.locale) changeLocale2();
	global.message1 = "";
	global.message2 = "";

}
