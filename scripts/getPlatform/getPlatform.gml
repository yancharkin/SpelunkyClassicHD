/// @description getPlatform
function getPlatform() {

	global.html5Build = !(os_browser == browser_not_a_browser);
	global.mobileBuild = (os_type == os_android) or (os_type == os_ios);

	if (global.html5Build) {
	    global.electronBuild = isElectron();
	} else {
	    global.electronBuild = false;
	}

	global.browserBuild = ((global.html5Build) and (!global.electronBuild));



}
