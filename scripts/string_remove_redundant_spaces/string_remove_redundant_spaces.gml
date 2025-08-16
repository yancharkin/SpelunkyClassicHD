function string_remove_redundant_spaces(str) {
	var old_str = "";
	repeat (string_length(str)) {
	    old_str = str;
	    str = string_replace_all(str, "  ", " ");
	    if (str == old_str) break;
	}
	return string_trim(str);
}