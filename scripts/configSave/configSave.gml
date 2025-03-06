/// @description configSave
function configSave() {
	
	var settingsMap = ds_map_create();
	if (file_exists(working_directory + "settings.json")) {
	    settingsMap = json2dsmap(working_directory + "settings.json");
	}
	
	ds_map_replace(settingsMap, "locale", global.locale);
	ds_map_replace(settingsMap, "locale2", global.locale2);
	// This is the only way <I found> to load values from the 'settings.json' correctly.
	// Any (?) other way cause issues either on the desktop (when locale is not 'en')
	// or on the HTML5 platform
	if (!global.html5Build) {
	    ds_map_replace(settingsMap, "fullscreen", bool(global.fullscreen));
	    ds_map_replace(settingsMap, "music", bool(global.music));
	    ds_map_replace(settingsMap, "toggleRunEnabled", bool(global.toggleRunEnabled));
	    ds_map_replace(settingsMap, "firstLaunch", bool(global.firstLaunch));
	} else {
	    ds_map_replace(settingsMap, "fullscreen", global.fullscreen);
	    ds_map_replace(settingsMap, "music", global.music);
	    ds_map_replace(settingsMap, "toggleRunEnabled", global.toggleRunEnabled);
	    ds_map_replace(settingsMap, "firstLaunch", global.firstLaunch);
	}
	ds_map_replace(settingsMap, "touchControlsVisibility", int64(global.touchControlsVisibility));

	dsmap2json(settingsMap, working_directory + "settings.json");
	ds_map_destroy(settingsMap);

}
