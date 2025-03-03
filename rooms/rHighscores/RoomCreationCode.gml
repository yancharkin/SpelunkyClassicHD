var localizedImagesDir = working_directory + "locale/locales/" + global.locale + "/images/";

if (!file_exists(localizedImagesDir + "reset_sign.png")) {
    localizedImagesDir = working_directory + "locale/en/images/";
}

if (instance_exists(oResetSign)) {
    sResetSignNew = sprite_add(localizedImagesDir + "reset_sign.png", 1, false, false, 0, 0);
    oResetSign.sprite_index = sResetSignNew;
}