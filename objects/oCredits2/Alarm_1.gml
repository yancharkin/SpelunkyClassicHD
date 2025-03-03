if (scrolling)
{
if (rand(1,8) == 1) instance_create(-16, 176, oShrubScroll);
else if (rand(1,12) == 1) instance_create(-32, 176-112, oPalmTreeScroll);

instance_create(-16, 176, oDesertTopScroll);
instance_create(-16, 192, oDesertScroll2);
instance_create(-16, 208, oDesertScroll);
instance_create(-16, 224, oDesertScroll);
with oDesertScroll { scroll = true; }
with oDesertScroll2 { scroll = true; }
with oDesertTopScroll { scroll = true; }
with oShrubScroll { scroll = true; }
with oPalmTreeScroll { scroll = true; }
alarm[1] = 16;
}
