# How to localize the game

To make the localization process easier, you can download [cheat builds](../CHEAT_BUILDS.md) from the [releases page](https://github.com/yancharkin/SpelunkyClassicHD/releases).

## Step 1
* go to the **locale** directory:
   **Linux**: [game directory]/assets/locale/
   **Windows**: [game directory]\locale\

* add language to the **locales.json** file, for example:

        "de": "DEUTSCHE"
    
* create a directory for localized files in **locales** directory, for example, **de**

* copy **text.json** from **en** (or other completed translation if you prefer) to the new directory

* translate text in the **text.json** file

For most languages, that's enough. The game will use TTF font **7-12-serif** from the **fonts** directory and you can play the localized game.

If you want to use a different font, copy **font.json** from **en** to the localization directory (**de** in the example) and edit it:

* **fontName** - name of the directory in the **fonts** directory containing target font (you can add your own monospace fonts there).
* **fontWidth** and **fontHeight** - font size. You may need to experiment with these values because sometimes font rendered not as you expect.
* **fontOffsetY** - only used to align HUD (life, bombs, rope, and money count). Start with 0 and if HUD misaligned adjust it.
* **messageBackground** - if in-game messages hard to read, set to true, it will draw a black background behind the text.

At this point, you can send localized files to me any way you like and I'll do the rest. Also, you can skip **step 2** (because it can be not so easy to do), create localized images (**step 3**), and then send me files. If you want to do everything yourself or you didn't find a TTF font that includes all characters you use in the translation and looks OK (can be the case for languages like Chinese and Japanese), read the rest of the instructions.

## Step 2

* create **charset** text file:
    * for most languages just add all letter from your language alphabet to **charset** file (if not already there)
    * for languages with lots of characters (like Chinese or Japanese):
        * copy **charset** file from **en** and add characters that you use in your translation to it
        * **OR** if you have python installed on your PC or willing to install it, you can use **generate_charset_text_file.py** script:
            * place **text.json** and **generate_charset_text_file.py** into the same directory
            * run **generate_charset_text_file.py**
            * check the generated file for mistakes and adjust if required

* create **charset.png** and **charset_small.png**:
    * first way:
        * draw additional characters yourself (that's how charset for Russian was done)
    * second way (requires python and pillow library):
        * place **generate_charset_image_file.py**, **charset** text file and (any monospace) TTF font into the same directory
        * run **generate_charset_image_file.py** (maybe you have to adjust **font_size** inside the script)
        * edit output file, it's not usable as-is, you have to, at least, resize it (in the original font each character is 16x16px in **charset.png** and 8x8px in **charset_small.png**, so use something close to these values)

* go to the directory with localized files, in the example: **.../locale/locales/de**
* create **charset** directory and place **charset**, **charset.png**, and **charset_small.png** here
* if your fonts not 8x8 and 16x16, create **font.json** file with the following content (adjust values):

        {
            "fontSmallWidth": 8,
            "fontSmallHeight": 10,
            "fontLargeWidth": 16,
            "fontLargeHeight": 20,
            "fontOffsetY": -5
        }

## Step 3

* copy **images** directory from **en** to the directory with localized files, in the example: **.../locale/locales/de**
* redraw images

## Questions?
If something not clear, ask questions [here](https://github.com/yancharkin/SpelunkyClassicHD/discussions/12) or [here](https://itch.io/t/1757542/translation-how-to-localize-the-game).

