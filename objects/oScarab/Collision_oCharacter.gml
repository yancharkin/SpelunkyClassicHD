global.collect += value;
global.collectCounter += 20;
if (global.collectCounter > 100) global.collectCounter = 100;
global.scarabs += 1;
playSound(global.sndCoin);
instance_destroy();
