/// @description json2dsmap(filepath)
/// @param filepath
function json2dsmap() {

	var filepath = argument[0];

	var i = 0;
	var data = "";
	var file = file_text_open_read(filepath);
	while (!file_text_eof(file)) {
	    data += file_text_read_string(file);
	    file_text_readln(file);
	}
	file_text_close(file);
	map = json_decode(data);

	return map;



}
