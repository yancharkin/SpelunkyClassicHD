//Without this fix, oTutorialSign sometimes
//blocks access to the tutorial cave in the HTML5 version.
if (global.html5Build) {
    oTutorialSign.y -= 1;
    oTutorialSign.depth = 55;
}

