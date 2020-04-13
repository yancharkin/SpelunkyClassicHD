//Get locales
var i = 0;
file = file_text_open_read(working_directory + "/translations/locales");
while (!file_text_eof(file)) {
    locales[i++] = file_text_read_string(file);
    file_text_readln(file);
}
file_text_close(file);

//Set locale
var newLocaleIndex = 0;
var localesN = array_length_1d(locales);
for (var i = 0; i < localesN; i++;) {
    if (locales[i] = global.lang) {
        newLocaleIndex = i + 1;
        if (newLocaleIndex = localesN) {
            newLocaleIndex = 0;
        }
    }
}
global.lang = locales[newLocaleIndex];
global.message = '';
global.message2 = '';
scrSetLocale();
scrLoadLocalizedSprites();
