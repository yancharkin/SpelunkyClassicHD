
pos = SS_GetSoundPosition(handle);
len = SS_GetSoundLength(handle);

draw_text(20,10,string_hash_to_newline("Sound position/length: "+
string(floor(pos/bps))+
"/"+
string(floor(len/bps))+
"  =  "+
string(pos/len*100)+
"%"));


