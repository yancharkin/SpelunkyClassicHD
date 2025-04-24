/// @description configSave
function configSave() {
	var settingsMap = ds_map_create();
	if (file_exists(getWorkingDirPath("settings.json"))) {
	    settingsMap = json2dsmap(getWorkingDirPath("settings.json"));
	}
	ds_map_replace(settingsMap, "locale", global.locale);
	ds_map_replace(settingsMap, "locale2", global.locale2);
	ds_map_replace(settingsMap, "fullscreen", bool(global.fullscreen));
	ds_map_replace(settingsMap, "music", bool(global.music));
	ds_map_replace(settingsMap, "toggleRunEnabled", bool(global.toggleRunEnabled));
	ds_map_replace(settingsMap, "firstLaunch", bool(global.firstLaunch));
	ds_map_replace(settingsMap, "touchControlsVisibility", real(global.touchControlsVisibility));
	ds_map_replace(settingsMap, "touchButtonsSize", int64(global.vkeySize));
	ds_map_replace(settingsMap, "touchOffsetH", real(global.touchOffsetH));
	dsmap2json(settingsMap, getWorkingDirPath("settings.json"));
	ds_map_destroy(settingsMap);
}