/// @description Get full path to a <file_name> in a working directory
/// @param file_name
function getWorkingDirPath(argument0) {
	var file_name = argument0;
	if (os_type == os_linux) {
		if (environment_get_variable("XDG_CONFIG_HOME") != "") {
			return environment_get_variable("XDG_CONFIG_HOME") + "/" + game_project_name + + "/" + file_name;
		}
		return environment_get_variable("HOME") + "/.config/" + game_project_name + "/" + file_name;
	} else if (os_type == os_windows) {
		if (not file_exists(working_directory + "portable.txt") and (not file_exists(working_directory + "portable"))) {
			return game_save_id  + file_name;
		}
	}
	return working_directory + file_name;
}