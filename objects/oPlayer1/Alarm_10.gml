obj = instance_create(x+rand(0,3)-rand(0,3), y+rand(0,3)-rand(0,3), oFlareSpark);
obj.yVel = rand(1,3);
obj.xVel = rand(0,3) - rand(0,3);
playSound(global.sndJetpack);
