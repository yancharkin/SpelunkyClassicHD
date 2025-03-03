/// @description dsmap2json(map, filepath)
/// @param map
/// @param  filepath
function dsmap2json() {

	var map = argument[0];
	var filepath = argument[1];

	str = json_encode(map);
	file = file_text_open_write(filepath);
	file_text_write_string(file, str);
	file_text_close(file);



}
