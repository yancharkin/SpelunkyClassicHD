///setLocale

if (global.firstLaunch) {
    var osLocale = os_get_language();
    if (ds_map_exists(global.localesMap, osLocale)) {
        global.locale = osLocale;
    }
    global.firstLaunch = false;
    configSave();
}

var localeDir = working_directory + "locale/locales/" + global.locale;

//loadFonts
if (file_exists(localeDir + "/charset/charset") and
        file_exists(localeDir + "/charset/charset.png") and
        file_exists(localeDir + "/charset/charset_small.png")) {
    //Sprite font
    var file = file_text_open_read(localeDir + "/charset/charset");
    charset = file_text_read_string(file);
    file_text_close(file);
    chars_n = string_length(charset);
    fontSprite = sprite_add(localeDir + "/charset/charset.png", chars_n, false, false, 0, 0);
    fontSpriteSmall = sprite_add(localeDir + "/charset/charset_small.png", chars_n, false, false, 0, 0);
    global.fontSmallWidth = 8;
    global.fontSmallHeight = 8;
    global.fontLargeWidth = 16;
    global.fontLargeHeight = 16;
    global.fontOffsetY = 0;
    global.messageBackground = false;
    global.fontLarge = font_add_sprite_ext(fontSprite, charset, false, 0);
    global.fontSmall = font_add_sprite_ext(fontSpriteSmall, charset, false, 0);
} else {
    //TTF or WOFF
    if (file_exists(localeDir + "/font.json")) {
        fontInfo = json2dsmap(localeDir + "/font.json");
        fontName = fontInfo[? "fontName"];
    } else {
        font = json2dsmap(working_directory + "locale/fonts.json");
        fontName = font[? "fontName"];
        ds_map_destroy(font);
        fontInfo = json2dsmap(working_directory + "locale/fonts/" + fontName + "/font.json");
    }
    fontDir = working_directory + "locale/fonts/" + fontName + "/font/";
    if (!global.html5Build) {
        fontName = fontName + ".ttf";
    } else {
        fontName = fontName + ".woff";
    }
    fontPath = fontDir + fontName;
    global.fontSmallWidth = int64(fontInfo[? "fontWidth"]);
    global.fontSmallHeight = int64(fontInfo[? "fontHeight"]);
    global.fontOffsetY =  int64(fontInfo[? "fontOffsetY"]);
    global.messageBackground = bool(fontInfo[? "messageBackground"]);
    global.fontLargeWidth = global.fontSmallWidth * 2
    global.fontLargeHeight = global.fontSmallHeight * 2;
    global.fontLarge = font_add(fontPath, global.fontLargeHeight, false, false, 0, 255);
    global.fontSmall = font_add(fontPath, global.fontSmallHeight, false, false, 0, 255);
    ds_map_destroy(fontInfo);
}

//loadText
var localizedTextFile = localeDir + "/text.json";
global.localizedTextMap = json2dsmap(localizedTextFile);
