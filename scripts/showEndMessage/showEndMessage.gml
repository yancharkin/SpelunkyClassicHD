function showEndMessage(){
	if (instance_exists(oPlayer1))
	{
	    if (oPlayer1.dead or isRoom("rMoon"))
	    {
	        if (isLevel())
	        {
	            if (drawStatus > 0)
	            {
	                drawTextHCentered(tr("GAME OVER"), "large", c_yellow, 0, 32+16);
	            }
	            if (drawStatus > 1)
	            {
	                drawTextHCentered(tr("FINAL SCORE:"), "small", c_yellow,  0, 64+16);
	            }
	            if (drawStatus > 2)
	            {
	                drawTextHCentered(tr("$") + string(moneyCount), "large", c_white, 0, 72+16);
	                if (global.customLevel)
	                {
	                    if (global.testLevel != "")
	                    {
	                        if (global.gamepadOn) str = tr("PRESS ") + scrGetJoy(global.joyAttackVal) + tr(" TO EDIT LEVEL.");
	                        else str = tr("PRESS ") + scrGetKey(global.keyAttackVal) + tr(" TO EDIT LEVEL.");
	                    }
	                    else
	                    {
	                        if (global.gamepadOn) str = tr("PRESS ") + scrGetJoy(global.joyAttackVal) + tr(" TO LOAD ANOTHER LEVEL.");
	                        else str = tr("PRESS ") + scrGetKey(global.keyAttackVal) + tr(" TO LOAD ANOTHER LEVEL.");
	                    }
	                    drawTextHCentered(str, "small", c_yellow, 0, 120);
	                }
	                else
	                {
	                    if (global.gamepadOn) str = tr("PRESS ") + scrGetJoy(global.joyAttackVal) + tr(" FOR HIGH SCORES.");
	                    else str = tr("PRESS ") + scrGetKey(global.keyAttackVal) + tr(" FOR HIGH SCORES.");
	                    drawTextHCentered(str, "small", c_yellow, 0, 120);
	                }
	            }
	        }
	        else if (isRoom("rSun"))
	        {
	            if (drawStatus > 0)
	            {
	                drawTextHCentered(tr("FINISHED!"), "large", c_yellow, 0, 32+16);
	            }
	            if (drawStatus > 1)
	            {
	                if (oSunRoom.highscore) str = tr("YOU SET A NEW RECORD!");
	                else str = tr("BETTER LUCK NEXT TIME...");
	                drawTextHCentered(str, "small", c_yellow, 0, 64+16);
	            }
	        }
	        else if (isRoom("rMoon"))
	        {
	            if (oMoonRoom.timer < 0)
	            {
	                if (drawStatus > 0)
	                {
	                    drawTextHCentered(tr("FINISHED!"), "large", c_yellow, 0, 32+16);
	                }
	                if (drawStatus > 1)
	                {
	                    if (oMoonRoom.highscore) str = tr("YOU SET A NEW RECORD!");
	                    else str = tr("BETTER LUCK NEXT TIME...");
	                    drawTextHCentered(str, "small", c_yellow,0, 64+16);
	                }
	            }
	        }
	        else if (isRoom("rStars"))
	        {
	            if (drawStatus > 0)
	            {
	                drawTextHCentered(tr("FINISHED!"), "large", 0, 32+16);
	            }
	            if (drawStatus > 1)
	{
	                if (oStarsRoom.highscore) str = tr("YOU SET A NEW RECORD!");
	                else str = tr("BETTER LUCK NEXT TIME...");
	                drawTextHCentered(str, "small", c_yellow, 0, 64+16);
	            }
	        }
	    }
	}
	action_color(16777215);
	action_color(-100);
}