/// @description getPlatform
function getPlatform() {
	global.mobileBuild = (os_type == os_android) or (os_type == os_ios);
	global.html5Build = (os_type == os_gxgames);
	global.html5Mobile = false;
	if (os_type == os_gxgames) {
	    var _info = os_get_info();
	    if (_info[? "mobile"]) {
	        global.html5Mobile = true;
	    }
	}
	global.html5StandaloneBuild = false; // have to set this manually for PWA and Electron
}