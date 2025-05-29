function string_has_digits(text){
	for (var i = 0; i < 10; ++i) {
		var digitPos = string_pos(string(i), text);
		if (digitPos != 0) {
			if (string_char_at(text, digitPos-1) != " " or string_char_at(text, digitPos+1) != " ") {
				return true;
			}
		}
	}
	return false;
}