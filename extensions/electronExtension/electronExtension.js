function isElectron() {
    if (navigator.userAgent.toLowerCase().indexOf('electron') > -1) {
        return true;
    } else {
        return false;
    }
}

if (isElectron()) {
    var electron = require('electron');
    var win = electron.remote.getCurrentWindow();
    var defaultWinSize = win.getSize();
}

function electronQuit() {
    electron.remote.process.exit();
}

function electronSetFullscreen(fullscreen) {
    if (fullscreen == true) {
        win.resizable = true;
        win.setFullScreen(true);
        win.resizable = false;
        return win.getSize();
    } else {
        win.resizable = true;
        win.setFullScreen(false);
        win.resizable = false;
        return defaultWinSize;
    }
}
