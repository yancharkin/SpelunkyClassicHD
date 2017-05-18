/*
Returns whether the current object is allowed to land on platforms.
Currently, only the players can land on platforms.
To make certain enemies able to land on platforms, edit this script.
*/
return object_index=oCharacter or object_get_parent(object_index)=oCharacter
