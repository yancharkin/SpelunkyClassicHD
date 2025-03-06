/// @description loadLocalizedSprites
function loadLocalizedSprites() {
	var localizedImagesDir = working_directory + "locale/locales/" + global.locale + "/images/";
	if (!file_exists(localizedImagesDir + "level5_sign.png")) {
	    localizedImagesDir = working_directory + "locale/locales/en/images/";
	}
	if (instance_exists(oLevel5Sign)) {
	    sLevel5SignNew = sprite_add(localizedImagesDir + "level5_sign.png", 1, false, false, 0, 0);
	    oLevel5Sign.sprite_index = sLevel5SignNew;
	}
	if (instance_exists(oLevel9Sign)) {
	    sLevel9SignNew = sprite_add(localizedImagesDir + "level9_sign.png", 1, false, false, 0, 0);
	    oLevel9Sign.sprite_index = sLevel9SignNew;
	}
	if (instance_exists(oLevel13Sign)) {
	    sLevel13SignNew = sprite_add(localizedImagesDir + "level13_sign.png", 1, false, false, 0, 0);
	    oLevel13Sign.sprite_index = sLevel13SignNew;
	}
	if (instance_exists(oQuitSign)) {
	    sQuitSignNew = sprite_add(localizedImagesDir + "quit_sign.png", 1, false, false, 0, 0);
	    oQuitSign.sprite_index = sQuitSignNew;
	}
	if (instance_exists(oScoresSign)) {
	    sScoresSignNew = sprite_add(localizedImagesDir + "scores_sign.png", 1, false, false, 0, 0);
	    oScoresSign.sprite_index = sScoresSignNew;
	}
	if (instance_exists(oStartSign)) {
	    sStartSignNew = sprite_add(localizedImagesDir + "start_sign.png", 1, false, false, 0, 0);
	    oStartSign.sprite_index = sStartSignNew;
	}
	if (instance_exists(oTutorialSign)) {
	    sTutorialSignNew = sprite_add(localizedImagesDir + "tutorial_sign.png", 1, false, false, 0, 0);
	    oTutorialSign.sprite_index = sTutorialSignNew;
	}
	if (instance_exists(oResetSign)) {
	    sResetSignNew = sprite_add(localizedImagesDir + "reset_sign.png", 1, false, false, 0, 0);
	    oResetSign.sprite_index = sResetSignNew;
	}
}