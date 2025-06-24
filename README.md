# Spelunky Classic HD

A modified version of [Derek Yu's](https://en.wikipedia.org/wiki/Derek_Yu) game [Spelunky Classic](https://spelunkyworld.com/original.html). Based on the source code published in **Humble Weekly Bundle: Play and Create with GameMaker** (not original 1.1 release).

<p align="center">
    <img src="screenshots/screenshot_00.png" width="48%">
    <img src="screenshots/screenshot_01.png" width="48%">
</p>

## New in this version:
- builds for different operating systems
- different aspect ratios up to 21:9 (originally 4:3 only)
- touch input
- better gamepads support
- support for translations

## Hidden/Non-Obvious Features
1. To change touch controls visibility hold 👁 + $ simultaneously for half a second
2. The language key/button allows quick switching between two languages, which can be useful for language learners
3. Custom configuration directory:
    - Windows: if portable or portable.txt exists in the game directory, configs save here as well
    - Linux: respects XDG_CONFIG_HOME environment variable
4. Gamepad buttons custom names
    - Navigate to config directory:
        - Windows: C:\users\USER_NAME\AppData\Local\SpelunkyClassicHD
        - Linux: ~/.config/SpelunkyClassicHD
    - Copy gamepad.json and rename to gamepadmapping.json
    - Swap keys/values in the new file and adjust names. For example to rename "1" to "A":
        - Original (gamepad.json):

            ```json
            { "joyJumpVal": "1" }
            ```

        - New (gamepadmapping.json):

            ```json
            { "1": "A" }
            ```

## Translators
- Spanish: [grheavy](mailto:grheavy@hushmail.com), [BRNBot3k](https://github.com/BRNBot3k)
- Esperanto: [Spenĉjo](https://github.com/Rajzin)
- Brazilian Portuguese: [Gabriel Albuquerque Ferreira](https://github.com/ngc-5194)
- Ukrainian: [bakustarver](https://github.com/bakustarver)
- French: [LeRetardatN](https://github.com/Lecodeurenretard)
- German: [MasterPhW](mailto:masterphw@gmail.com)

## Links
* [How to localize the game](localization)
* [HTML5 version](https://github.com/yancharkin/SpelunkyClassicHDhtml5)
* [Itch](https://yancharkin.itch.io/spelunky-classic-hd)
