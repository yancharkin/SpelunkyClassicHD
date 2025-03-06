/// @description json2struct(filepath)
/// @param filepath
function json2struct() {

	var filepath = argument[0];

	var i = 0;
	var data = "";
	var file = file_text_open_read(filepath);
	while (!file_text_eof(file)) {
	    data += file_text_read_string(file);
	    file_text_readln(file);
	}
	file_text_close(file);
	json_struct  =json_parse(data);

	return json_struct;
}