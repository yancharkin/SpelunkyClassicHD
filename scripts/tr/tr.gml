/// @description tr(key)
/// @param key
function tr() {
	if (!ds_map_exists(global.localizedTextMap, argument[0])) {
	    return argument[0];
	} else if (global.localizedTextMap[? argument[0]] == "") {
	    return argument[0];
	} else {
	    return string_upper(global.localizedTextMap[? argument[0]]);
	}



}
