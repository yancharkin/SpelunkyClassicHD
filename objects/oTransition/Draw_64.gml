/// @description Draw touch controls
if (!global.html5Build) {
    drawTouchControls();
}

///TouchInput
if ((global.mobileBuild) or (global.html5Build)) {
    enableTouchInput();
}

