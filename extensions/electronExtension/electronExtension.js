function isElectron() {
    if (navigator.userAgent.toLowerCase().indexOf('electron') > -1) {
        return true;
    } else {
        return false;
    }
}

if (isElectron()) {
    let windowSize = [window.innerWidth, window.innerHeight];
    let aspectRatio = windowSize[0]/windowSize[1];
    var defaultWinSize = [800, Math.round(800/aspectRatio)];
    var canvas = document.getElementById("canvas");
}

function electronQuit() {
    window.close()
}

function electronSetFullscreen(fullscreen) {
    if (fullscreen) {
        try {
            if (!document.fullscreenElement) {
                canvas.requestFullscreen();
            }
        } catch (error) {
            console.log(error);
        }
        return [window.screen.width, window.screen.height];
    } else {
        try {
            if (document.fullscreenElement) {
                document.exitFullscreen();
            }
        } catch (error) {
            console.log(error);
        }
        return defaultWinSize;
    }
}
