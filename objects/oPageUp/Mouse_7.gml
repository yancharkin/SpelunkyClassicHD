oLoadLevel.page -= 1;
with oMenuSel { sprite_index = sMenuSelOff; }
instance_activate_object(oPageDown);
if (oLoadLevel.page <= 1) instance_deactivate_object(oPageUp);

