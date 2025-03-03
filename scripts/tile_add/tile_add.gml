/// @description Adds a new tile to the room, allowing customisation of its attributes, and returning its index.
/// @param background The background asset from which the new tile will be extracted.
/// @param left The x coordinate of the left of the new tile, relative to the background asset's top left corner.
/// @param top The y coordinate of the top of the new tile, relative to the background assets top left corner.
/// @param width The width of the tile.
/// @param height The height of the tile.
/// @param x The x position in the room to place the tile.
/// @param y The y position in the room to place the tile.
/// @param depth The depth at which to place the tile.
/// @returns {number} resource name for the new tile
function tile_add(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7) {

	var __back = argument0;
	var __left = argument1;
	var __top = argument2;
	var __width = argument3;
	var __height = argument4;
	var __x = argument5;
	var __y = argument6;
	var __depth = argument7;

	// Scan for a layer with the correct depth
	var __layers = layer_get_all();
	var __numlayers = array_length_1d(__layers);

	var __layertouse = -1;
	var __i;
	for(__i = 0; __i < __numlayers; __i++)
	{
		if (layer_get_depth(__layers[__i]) == __depth)
		{
			// Don't bother checking names - we'll just add tiles to whatever layer is handy
			__layertouse = __layers[__i];
			break;		
		}
	}

	if (__layertouse == -1)
	{
		// didn't find a layer of the correct depth, so create one
		__layertouse = layer_create(__depth);
	}

	// Now create a new tile element and add it to the layer
	var __tile = layer_tile_create(__layertouse, __x, __y, __back, __left, __top, __width, __height);

	return __tile;


}
