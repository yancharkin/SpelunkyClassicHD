oLoadLevel.page += 1;
with oMenuSel { sprite_index = sMenuSelOff; }
instance_activate_object(oPageUp);
if (oLoadLevel.page >= oLoadLevel.numPages) instance_deactivate_object(oPageDown);
