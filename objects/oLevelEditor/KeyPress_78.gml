if (status == EXIT)
{
    global.titleStart = 2;
    if (file_exists(working_directory + "levels/test.tmp")) file_delete(working_directory + "levels/test.tmp");
    room_goto(rTitle);
}
else if (status == NEW)
{
    global.testLevel = "";
    room_restart();
}

