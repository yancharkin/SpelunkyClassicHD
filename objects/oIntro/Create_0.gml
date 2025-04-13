fadeIn = false;
fadeOut = false;
fadeLevel = 1;
// instance_create(-32, 184, oPDummy3);

randomize();

drawStatus = 0;
alarm[11] = 20;

str = "";
n = round(random_range(1,8));
switch (n)
{
    case 1: { str1 = "AS THE MOON BURNED BRIGHT ABOVE,"; break; }
    case 2: { str1 = "WITH THE DESERT STRETCHING BEHIND ME,"; break; }
    case 3: { str1 = "AFTER I DOUBLE-CHECKED MY MAP,"; break; }
    case 4: { str1 = "MY LIPS CRACKED AND COVERED IN SAND,"; break; }
    case 5: { str1 = "WITH FATE GUIDING MY EVERY MOVE,"; break; }
    case 6: { str1 = "PUTTING THE FADED PHOTO IN MY POCKET,"; break; }
    case 7: { str1 = "AS I RECALLED MY FATHER'S LAST WORDS,"; break; }
    case 8: { str1 = "MY MEMORY SLIPPING AWAY FROM ME,"; break; }
}
n = round(random_range(1,8));
switch (n)
{
    case 1: { str2 = "I STRODE VALIANTLY TOWARD MY DESTINY,"; break; }
    case 2: { str2 = "I SQUEEZED THE WHIP AT MY SIDE,"; break; }
    case 3: { str2 = "I DRAINED THE REST OF MY CANTEEN,"; break; }
    case 4: { str2 = "I SPOTTED THE CAVE'S ENTRANCE,"; break; }
    case 5: { str2 = "I FURROWED MY BROW,"; break; }
    case 6: { str2 = "I PAID MY BEDOUIN GUIDE,"; break; }
    case 7: { str2 = "I DISMOUNTED MY CAMEL,"; break; }
    case 8: { str2 = "I SQUINTED INTO THE DARKNESS,"; break; }
}
n = round(random_range(1,8));
switch (n)
{
    case 1: { str3 = "AND THOUGHT OF HER ONE LAST TIME."; break; }
    case 2: { str3 = "AND HELD MY HAT AGAINST THE WIND."; break; }
    case 3: { str3 = "AND A COLD CHILL TOOK HOLD OF ME."; break; }
    case 4: { str3 = "AND WONDERED HOW LONG I'D BE BELOW."; break; }
    case 5: { str3 = "AND VOWED TO RETURN VICTORIOUS."; break; }
    case 6: { str3 = "AND SWORE I HEARD VOICES UP AHEAD."; break; }
    case 7: { str3 = "AND FELT THE GODS SMILING UPON ME."; break; }
    case 8: { str3 = "AND THAT'S WHEN IT ALL STARTED."; break; }
}