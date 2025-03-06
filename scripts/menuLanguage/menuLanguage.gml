/// @description menuLanguage
function menuLanguage() {
	if (!global.html5Build) {
	    instance_activate_all();
	    changeLocale();
	    setLocale();
	    loadLocalizedSprites();
	    instance_deactivate_all(true);
	} else {
	    changeLocale();
	    localeChanged = true;
	    changeSprites = true;
	}
}
