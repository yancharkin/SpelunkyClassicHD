/// @description changeLocale2
function changeLocale2() {

	var newLocaleIndex = 0;
	var localesN = array_length(global.localesArray);
	for (var i = 0; i < localesN; i++;) {
	    if (global.localesArray[i] = global.locale2) {
	        newLocaleIndex = i + global.locale2ChangeBy;
	        if (newLocaleIndex = localesN) {
	            newLocaleIndex = 0;
	        }
			if (newLocaleIndex < 0) {
	            newLocaleIndex = localesN-1;
	        }
	    }
	}

	global.locale2 = global.localesArray[newLocaleIndex];
	if (global.locale2 == global.locale) changeLocale2();
	global.message = "";
	global.message2 = "";

}
