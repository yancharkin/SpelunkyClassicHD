if (isRoom("rCredits1") and instance_exists(oCamel)) and oCredits1.scrolling {
    xOff += 0.01;
} else if (__view_get( e__VW.XView, 0 ) != 0) and (__view_get( e__VW.XView, 0 ) < 960 - global.display_w) {
    xOff -= 0.01;
}
x = __view_get( e__VW.XView, 0 ) + 208 + xOff;