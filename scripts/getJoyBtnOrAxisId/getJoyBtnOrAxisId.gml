/// @description getJoyBtnOrAxisId(buttonId)
/// Convets buttonId to int64 if it is not started with 'a' (axis)
/// @param buttonId

function getJoyBtnOrAxisId() {
	if (is_string(argument0) and
			((not string_starts_with(argument0, "a")) and (not string_starts_with(argument0, "h")))) {
		return int64(argument0);
	};
	return argument0;
}