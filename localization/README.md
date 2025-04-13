# How to localize the game

To simplify the localization process, you can download [cheat builds](../CHEAT_BUILDS.md) from the [releases page](https://github.com/yancharkin/SpelunkyClassicHD/releases).

## Step 1

1. Navigate to the **locale** directory:

    * **Windows**: [game directory]\locale\
  
    * **Linux**: [game directory]/assets/locale/

2. Add your language to the **locales.json** and **locales_tr.json** files
    * Follow the format used for other languages. Example:

          "de": "DEUTSCHE"

3. Create a directory for localized files

    * Inside the **locale/locales/** directory, create a new directory with your language code (e.g., **de** for German).

4. Copy and translate the text file

    * Copy **text.json** from the **en** directory (or another completed translation) into your new directory.
    * Translate the text inside **text.json**.
    * Tip: Try to keep the line lengths roughly the same as the original to maintain formatting. Ideally, each string should be no more than 40 characters to fit on a 4:3 screen, or 53 characters for 16:9.

_**For most languages, this is enough to get a working translaton. The game will use TTF font\* '7-12-serif' from the 'fonts' directory, allowing you to play the localized version. Other steps are optional.**_

### * Note about TTF Fonts

It is possible to use any TTF font, to do so copy **font.json** from the **en** to your localization directory (**de** in this example) and edit it:
* **fontName** - name of the directory in the **fonts** directory containing target font.
* **fontWidth** and **fontHeight** - font size. You may need to experiment with these values, as fonts sometimes render differently than expected.
* **fontOffsetY** - used only to align the HUD (life, bombs, rope, and money count). Start with 0; if the HUD misaligned, adjust it accordingly.
* **messageBackground** - if set to true, a black background will be added behind the text.

_**TTF fonts look very different from the default font. They are useful for quick testing, but if possible, consider creating a bitmap font (see Step 2).**_

## Step 2

1. Copy the charset directory
    * Copy the **charset** directory from **en** to your localized files directory.
    * Example: /locale/locales/de/
  
2. Modify the charset file
    * For most languages, simply add all letters from your language’s alphabet to **charset/charset** (if they’re not already there).
    * For languages with many characters (e.g., Chinese or Japanese):
      * Only add the characters used in your translation (no need to include every kanji, for example).
        * The easiest way to do this is with the provided Python script:
          * Place **text.json** and **generate_charset_text_file.py** in the same directory.
          * Run **generate_charset_text_file.py**.
          * Check the generated file for mistakes and adjust if needed.

3. Modify or create **charset.png** and **charset_small.png**
    * Option 1: Draw additional characters manually.
    * Option 2: Use a Python script (requires the Pillow library):
      * Place **generate_charset_image_file.py**, the **charset** text file, and a monospace TTF font in the same directory.
      * Run **generate_charset_image_file.py** (you may need to adjust font_size inside the script).
      * Edit the output file - it’s not usable as-is. Use it as a base for creating a font. At a minimum, you need to resize it. In the original font, each character is 16×16px in **charset.png** and 8×8px in **charset_small.png**, so aim for similar values.

4. Adjust font settings (if necessary)
    * If your fonts are not 8×8 and 16×16, create a **font.json** file with the following content (adjust values as needed):

          {
              "fontSmallWidth": 8,
              "fontSmallHeight": 10,
              "fontLargeWidth": 16,
              "fontLargeHeight": 20,
              "fontOffsetY": -5
          }

## Step 3

1. Copy the images directory
    * Copy the **images** directory from **en** to your localized files directory.
    * Example: /locale/locales/de/

2. Redraw the images
    * Modify the images as needed to match the new language.

## Questions?

If something is unclear, feel free to ask questions [here](https://github.com/yancharkin/SpelunkyClassicHD/discussions/12) or [here](https://itch.io/t/1757542/translation-how-to-localize-the-game).
