/// @description getLocales
function getLocales() {
	global.localesMap = json2dsmap(working_directory + "locale/locales.json");
	var key = ds_map_find_first(global.localesMap);
	for (var i = 0; i < ds_map_size(global.localesMap); i++) {
	    global.localesArray[i] = key;
	    key = ds_map_find_next(global.localesMap, key);
	}
	global.localesTr = json2struct(working_directory + "locale/locales_tr.json");
}
