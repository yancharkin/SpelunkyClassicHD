//
// scrResetHighscores(type)
//
// Reset highscores.
//

/**********************************************************************************
    Copyright (c) 2008, 2009 Derek Yu and Mossmouth, LLC
    
    This file is part of Spelunky.

    You can redistribute and/or modify Spelunky, including its source code, under
    the terms of the Spelunky User License.

    Spelunky is distributed in the hope that it will be entertaining and useful,
    but WITHOUT WARRANTY.  Please see the Spelunky User License for more details.

    The Spelunky User License should be available in "Game Information", which
    can be found in the Resource Explorer, or as an external file called COPYING.
    If not, please obtain a new copy of Spelunky from <http://spelunkyworld.com/>
    
***********************************************************************************/

ini_open("spelunky.ini")

ini_write_real("highscore","value1",0)
ini_write_real("highscore","value2",0)
ini_write_real("highscore","value3",0)
ini_write_real("highscore","value4",0)
ini_write_real("highscore","value5",0)
ini_write_real("highscore","value6",0)
ini_write_real("highscore","value7",0)
ini_write_real("highscore","value8",global.tunnel1Max+1)
ini_write_real("highscore","value9",global.tunnel2Max+1)
ini_write_real("highscore","value10",0)

ini_close()
