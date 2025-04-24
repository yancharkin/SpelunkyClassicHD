/// @description menuLanguage
function menuLanguage() {
	instance_activate_all();
	changeLocale();
	setLocale();
	loadLocalizedSprites();
	if (global.message1_src != "") {
		trMessages(global.message1_src, global.message2_src, global.messageHighlights, global.message2Highlights, global.messageTimer);
	};
	instance_deactivate_all(true);
}