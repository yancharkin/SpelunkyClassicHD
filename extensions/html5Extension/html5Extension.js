var canvas = document.getElementById("canvas");
var defaultSize = [window.innerWidth, window.innerHeight];
//var defaultSize = [canvas.width, canvas.height];

mappingXbox = {
    0: "A",
    1: "B",
    2: "X",
    3: "Y",
    4: "LB",
    5: "RB",
    6: "LT",
    7: "RT",
    8: "SELECT",
    9: "START",
    10: "LSTICK",
    11: "RSTICK"
}

function html5_gamepad_connected() {
    if (navigator.getGamepads()[0]) {
        return true;
    } else {
        return false;
    }
}

function html5_gamepad_next(currentGamepadIndex) {
    let gamepadsN = navigator.getGamepads().length
    if (gamepadsN == 0) {
        return 0;
    }
    let newGamepadIndex = 0;
    for (let i = 0; i < gamepadsN ; i++) {
        if (i == currentGamepadIndex) {
            newGamepadIndex = i + 1;
            if (newGamepadIndex >= gamepadsN) {
                newGamepadIndex = 0;
            }
        }
    }
    return newGamepadIndex;
}

function html5_gamepad_get_button_name(gamepadIndex, buttonIndex) {
    let gamepad = navigator.getGamepads()[gamepadIndex];
    if (gamepad) {
        if ((gamepad.mapping == "standard") ||
                (gamepad.id.includes('X-Box')) ||
                (gamepad.id.includes('Xbox'))) {
            return mappingXbox[buttonIndex];
        } else {
            return buttonIndex;
        }
    } else {
        return buttonIndex;
    }
}

function html5_gamepad_button_check(gamepadIndex, buttonIndex) {
    let gamepad = navigator.getGamepads()[gamepadIndex];
    if ((!gamepad) || (!gamepad.buttons[buttonIndex])) {
        return false;
    } else {
        return gamepad.buttons[buttonIndex].pressed;
    }
}

function html5_gamepad_axis_value(gamepadIndex, axisIndex) {
    let gamepad = navigator.getGamepads()[gamepadIndex];
    if ((!gamepad) || (!gamepad.axes[axisIndex])) {
        return 0;
    } else {
    return gamepad.axes[axisIndex]
    }
}

function html5_set_fullscreen(fullscreen) {
    if ((fullscreen) && (!document.fullscreenElement)) {
        canvas.requestFullscreen();
        return [screen.width, screen.height];
    } else {
        if (document.fullscreenElement) {
            document.exitFullscreen();
        }
        return defaultSize;
    }
}

window.addEventListener("gamepadconnected", (event) => {
    let gamepad = event.gamepad;
    console.log("Gamepad connected: " + gamepad.id);
});

window.addEventListener("gamepaddisconnected", (event) => {
    let gamepad = event.gamepad;
    console.log("Gamepad disconnected: " + gamepad.id);
})

document.addEventListener("keypress", function() {
    if (document.documentElement.requestFullScreen) {
        document.documentElement.requestFullScreen();
    }
})
