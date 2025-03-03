fadeIn = true;
fadeOut = false;
fadeLevel = 1;

instance_create(-120, 112, oIntroBG);
// alarm[0] = 20;

drawStatus = 0;
scrollStart = false;
scrolling = false;

if (instance_exists(oScreen)) { oScreen.canPause = false; }

stopAllMusic();

