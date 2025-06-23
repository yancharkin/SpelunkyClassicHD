function toggleCheats() {
	if (global.debugBuild == false) {
		global.debugBuild = true;
		if not instance_exists(oDebug) instance_create(0, 0, oDebug);
	} else {
		global.debugBuild = false;
		if instance_exists(oDebug) instance_destroy(oDebug);
	}
}