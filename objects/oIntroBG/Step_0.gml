if (isRoom("rCredits1") and instance_exists(oCamel)) and oCredits1.scrolling {
    xOff += 0.02;
} else if (__view_get( e__VW.XView, 0 ) != 0) and (__view_get( e__VW.XView, 0 ) < 960 - global.display_w) { // 960 - room width; display_w - viewport width => stop scroll background if viewport not moving
    xOff -= 0.02;
}
x = __view_get( e__VW.XView, 0 ) + xOff;
