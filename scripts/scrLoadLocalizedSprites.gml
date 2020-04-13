trans_dir = working_directory + "translations/" + global.lang
trans_img_dir = trans_dir + "/images/"

if (instance_exists(oLevel5Sign)) {
    sLevel5SignNew = sprite_add(trans_img_dir + "level5_sign.png", 1, false, false, 0, 0);
    oLevel5Sign.sprite_index = sLevel5SignNew;
}

if (instance_exists(oLevel9Sign)) {
    sLevel9SignNew = sprite_add(trans_img_dir + "level9_sign.png", 1, false, false, 0, 0);
    oLevel9Sign.sprite_index = sLevel9SignNew;
}

if (instance_exists(oLevel13Sign)) {
    sLevel13SignNew = sprite_add(trans_img_dir + "level13_sign.png", 1, false, false, 0, 0);
    oLevel13Sign.sprite_index = sLevel13SignNew;
}

if (instance_exists(oQuitSign)) {
    sQuitSignNew = sprite_add(trans_img_dir + "quit_sign.png", 1, false, false, 0, 0);
    oQuitSign.sprite_index = sQuitSignNew;
}

if (instance_exists(oScoresSign)) {
    sScoresSignNew = sprite_add(trans_img_dir + "scores_sign.png", 1, false, false, 0, 0);
    oScoresSign.sprite_index = sScoresSignNew;
}

if (instance_exists(oStartSign)) {
    sStartSignNew = sprite_add(trans_img_dir + "start_sign.png", 1, false, false, 0, 0);
    oStartSign.sprite_index = sStartSignNew;
}

if (instance_exists(oTutorialSign)) {
    sTutorialSignNew = sprite_add(trans_img_dir + "tutorial_sign.png", 1, false, false, 0, 0);
    oTutorialSign.sprite_index = sTutorialSignNew;
}
