function __background_set(argument0, argument1, argument2) {
	var __prop = argument0;
	var __bind = argument1;
	var __val = argument2;

	var __backinfo = __background_get_element(__bind);

	__background_set_internal(__prop, __bind, __val, __backinfo);

	var __res = __background_get_internal(__prop, __bind, __backinfo);
	return __res;


}
