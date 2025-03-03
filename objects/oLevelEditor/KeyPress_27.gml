if (status == EDIT)
{
    status = EXIT;
}
else if (status == EXIT or status == EDIT_DOOR or status == EDIT_MSG)
{
    status = EDIT;
    instance_create(x, y, oEditButton);
    instance_create(x+320-32, y, oNewButton);
    instance_create(x+320-32, y, oTestButton);
}
else
{
    global.titleStart = 2;
    room_goto(rTitle);
}
