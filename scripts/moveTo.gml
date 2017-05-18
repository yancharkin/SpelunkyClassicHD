/*
Any object that has the collision bounds set can use this script. 
(To set the collision bounds, call the script "setCollisionBounds.")
If the object collides into a solid when moving the specified distance,
the object will stop precisely at the solid.
If the object collides into a "moveable solid," it will stop and push the
moveable solid.
This function also pushes moveable solids and allows the character to land on platforms.
Note: First the script moves the object in the x direction, then in
the y direction.
Once the functin is finished, one can use the xVelInteger and yVelInteger variables for
more precise calculations inside of the engine.

0: x distance to move
1: y distance to move
*/
mtXPrev=x
mtYPrev=y
//change the decimal arguments to integer variables with relation to time
xVelFrac=frac(abs(argument0))
yVelFrac=frac(abs(argument1))
xVelInteger=0
yVelInteger=0
if xVelFrac!=0
    if round(1/xVelFrac)!=0
         xVelInteger=(oGame.time mod round(1/xVelFrac)=0)
if yVelFrac!=0
    if round(1/yVelFrac)!=0
         yVelInteger=(oGame.time mod round(1/yVelFrac)=0)
xVelInteger+=floor(abs(argument0))
yVelInteger+=floor(abs(argument1))
if argument0<0
    xVelInteger*=-1
if argument1<0
    yVelInteger*=-1
xVelInteger=round(xVelInteger)
yVelInteger=round(yVelInteger)
//object is moving to the right
if xVelInteger>0
  for(x=x;x<mtXPrev+xVelInteger;x+=1)
  {
    solidId=getIdCollisionRight(1)
    //if there is a collision with a solid
    if solidId>0
    {
      if object_get_parent(solidId.object_index)=oMoveableSolid and canPushMoveableSolids()
      {
        //we must move the moveable solid, unless there is another solid (moveable or non-moveable) in it's way
        with solidId
        {
          if place_meeting(x+1,y,oSolid)      //there will be a collision!
          {
            break
          }
          else
          {
            x += 1;             //we're free to move the moveable solid
            if (not SS_IsSoundPlaying(global.sndPush)) playSound(global.sndPush);
          }
        }
      }
      else
        break
    }    
  }
//object is moving to the left
if xVelInteger<0
  for(x=x;x>mtXPrev+xVelInteger;x-=1)
  {
    solidId=getIdCollisionLeft(1)
    //if there is a collision with a solid
    if solidId>0
    {
      if object_get_parent(solidId.object_index)=oMoveableSolid and canPushMoveableSolids()
      {
        //we must move the moveable solid, unless there is another solid (moveable or non-moveable) in it's way
        with solidId
        {
          if place_meeting(x-1,y,oSolid)      //there will be a collision!
          {
            break
          }
          else
          {
            x-=1             //we're free to move the moveable solid
            if (not SS_IsSoundPlaying(global.sndPush)) playSound(global.sndPush);
          }
        }
      }
      else
        break
    } 
  }  
//object is moving down
if yVelInteger>0
  for(y=y;y<mtYPrev+yVelInteger;y+=1)
  {
    if isCollisionBottom(1)
      break
    if canLandOnPlatforms()
      if isCollisionPlatform()=0 and isCollisionPlatformBottom(1) and kDown=0
        break
  }
//object is moving up
if yVelInteger<0
  for(y=y;y>mtYPrev+yVelInteger;y-=1)
  {
    if isCollisionTop(1)
      break
  }
