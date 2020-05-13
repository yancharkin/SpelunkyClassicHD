///setLocale

if (global.firstLaunch) {
    var osLocale = os_get_language();
    if (ds_map_exists(global.localesMap, osLocale)) {
        global.locale = osLocale;
    }
    global.firstLaunch = false;
    configSave();
}

var localeDir = working_directory + "locale/" + global.locale;

//loadFonts
var file = file_text_open_read(localeDir + "/charset/charset");
charset = file_text_read_string(file);
file_text_close(file);
chars_n = string_length(charset);
Font_lang = sprite_add(localeDir + "/charset/charset.png", chars_n, false, false, 0, 0);
FontSmall_lang = sprite_add(localeDir + "/charset/charset_small.png", chars_n, false, false, 0, 0);
global.myFont = font_add_sprite_ext(Font_lang, charset, false, 0);
global.myFontSmall = font_add_sprite_ext(FontSmall_lang, charset, false, 0);

//loadText
var localizedTextFile = localeDir + "/text.json";
global.localizedTextMap = json2dsmap(localizedTextFile);
