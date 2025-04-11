function __view_set_internal(argument0, argument1, argument2) {
	var __prop = argument0;
	var __index = argument1;
	var __val = argument2;
	var __cam;

	switch(__prop)
	{
		case e__VW.XView: __cam = view_get_camera(__index); camera_set_view_pos(__cam, __val, camera_get_view_y(__cam)); break;
		case e__VW.YView: __cam = view_get_camera(__index); camera_set_view_pos(__cam, camera_get_view_x(__cam), __val); break;
		case e__VW.WView: __cam = view_get_camera(__index); camera_set_view_size(__cam, __val, camera_get_view_height(__cam)); break;
		case e__VW.HView: __cam = view_get_camera(__index); camera_set_view_size(__cam, camera_get_view_width(__cam), __val); break;
		case e__VW.Angle: __cam = view_get_camera(__index); camera_set_view_angle(__cam, __val); break;
		case e__VW.HBorder: __cam = view_get_camera(__index); camera_set_view_border(__cam, __val, camera_get_view_border_y(__cam)); break;
		case e__VW.VBorder: __cam = view_get_camera(__index); camera_set_view_border(__cam, camera_get_view_border_x(__cam), __val); break;
		case e__VW.HSpeed: __cam = view_get_camera(__index); camera_set_view_speed(__cam, __val, camera_get_view_speed_y(__cam)); break;
		case e__VW.VSpeed: __cam = view_get_camera(__index); camera_set_view_speed(__cam, camera_get_view_speed_x(__cam), __val); break;
		case e__VW.Object: __cam = view_get_camera(__index); camera_set_view_target(__cam, __val); break;
		case e__VW.Visible: __res = view_set_visible(__index, __val); break;
		case e__VW.XPort: __res = view_set_xport(__index, __val); break;
		case e__VW.YPort: __res = view_set_yport(__index, __val); break;
		case e__VW.WPort: __res = view_set_wport(__index, __val); break;
		case e__VW.HPort: __res = view_set_hport(__index, __val); break;
		case e__VW.Camera: __res = view_set_camera(__index, __val); break;
		//case e__VW.SurfaceID: __res = view_set_surface_id(__index, __val); break;
		case e__VW.SurfaceID: __res = view_get_surface_id(__index); break;
		default: break;
	};
	return 0;
}