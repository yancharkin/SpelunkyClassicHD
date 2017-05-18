/**
 * The game's step event.
 */

 
if (true) {
oGame.players[0] = noone     //players (used when "with( )" structures will not work)
oGame.players_length = 0
with oCharacter
{
  //necessary to reset the "viscid" movement from a moving solid
  viscidMovementOk=1
  //store the characters in the oGame.players variable
  oGame.players[oGame.players_length] = id
  oGame.players_length+=1
}

//since we are not using GM's hspeed and vspeed variables, we need to add in decimal support ourselves (so 0.25 will only move 1 pixel every 4 steps, for example)
oGame.time+=1
//we don't want the time to grow too large
if oGame.time>100000000
  oGame.time=0

//moves all of the solids so that none of them collide with the character
with oMovingSolid
{
  //applies the acceleration
  xVel+=xAcc
  yVel+=yAcc
  //approximates the "active" variables
  if approximatelyZero(xVel)
    xVel=0
  if approximatelyZero(yVel)
    yVel=0
  if approximatelyZero(xAcc)
    xAcc=0
  if approximatelyZero(yAcc)
    yAcc=0
  //moves the solid, pushes the character, carries the character, and stops if the character will be crushed by another solid
  mstXPrev=x
  mstYPrev=y
  //change the decimal arguments to integer variables with relation to time
  xVelFrac=frac(abs(xVel))
  yVelFrac=frac(abs(yVel))
  xVelInteger=0
  yVelInteger=0
  if xVelFrac!=0
    if round(1/xVelFrac)!=0
       xVelInteger=(oGame.time mod round(1/xVelFrac)=0)
  if yVelFrac!=0
    if round(1/yVelFrac)!=0
      yVelInteger=(oGame.time mod round(1/yVelFrac)=0)
  xVelInteger+=floor(abs(xVel))
  yVelInteger+=floor(abs(yVel))
  if xVel<0
    xVelInteger*=-1
  if yVel<0
    yVelInteger*=-1
  xVelInteger=round(xVelInteger)
  yVelInteger=round(yVelInteger)
  //calculate the collision bounds of the character -- we'll need it later
  with oCharacter
    calculateCollisionBounds()
  solidIsNearPlayers = 0    //whether the solid is near either of the players
  //determine if the solid is close to a player
  for(i=0;i<oGame.players_length;i+=1)
  {
    if isCollisionRectangle(x-abs(xVelInteger)-sprite_xoffset-2,y-abs(yVelInteger)-sprite_yoffset-2,x+sprite_width+abs(xVelInteger)-sprite_xoffset+2,y+sprite_height+abs(yVelInteger)-sprite_yoffset+2,oGame.players[i].lb,oGame.players[i].tb,oGame.players[i].rb,oGame.players[i].bb)
    {
      solidIsNearPlayers = 1    
      break
    }
  }
  if(solidIsNearPlayers)
  {
    //solid is moving to the right
    if xVelInteger>0
    {
      breakNow=0    //whether we should break out of the movement loop because the character is stuck
      for(x=x;x<mstXPrev+xVelInteger;x+=1)
      {
        for(i=0;i<oGame.players_length;i+=1)
        {
          var player;
          player=oGame.players[i]  
            
          if(viscidTop and isCollisionCharacterTop(1,player) and (player.viscidMovementOk=1 or player.viscidMovementOk=2))
          {
            with oGame.players[i]
              if isCollisionRight(1)=0
              {
                x+=1
                viscidMovementOk=2
              }
          }
          else if isCollisionCharacterRight(1,oGame.players[i])
          {
            with oGame.players[i]
              collision=isCollisionRight(1)
            if oGame.players[i].collision
            {
              breakNow = 1
              break
            }
            oGame.players[i].x+=1
          }
        }
        if breakNow
          break
      }
    }
    //solid is moving to the left
    if xVelInteger<0
    {
      breakNow=0    //whether we should break out of the movement loop because the character is stuck
      for(x=x;x>mstXPrev+xVelInteger;x-=1)
      {
        for(i=0;i<oGame.players_length;i+=1)
        {
          if viscidTop and isCollisionCharacterTop(1,oGame.players[i]) and (oGame.players[i].viscidMovementOk=1 or oGame.players[i].viscidMovementOk=2)
          {
            with oGame.players[i]
              if isCollisionLeft(1)=0
              {
                x-=1
                viscidMovementOk=2
              }
          }
          else if isCollisionCharacterLeft(1,oGame.players[i])
          {
            with oGame.players[i]
              collision=isCollisionLeft(1)
            if oGame.players[i].collision
            {
              breakNow = 1
              break
            }
            oGame.players[i].x-=1
          }
        }
        if breakNow
          break
      }
    }
    //solid is moving down
    if yVelInteger>0
    {
      breakNow=0    //whether we should break out of the movement loop because the character is stuck
      for(y=y;y<mstYPrev+yVelInteger;y+=1)
      {
        for(i=0;i<oGame.players_length;i+=1)
        {
          if viscidTop and isCollisionCharacterTop(2,oGame.players[i])
          {
            //since we do not want to include the solid that is pulling the character down,
            //we must alter the position of the solid to get around this dilemma
            y+=5
            with oGame.players[i]
              if isCollisionBottom(1)=0
                y+=1
            y-=5
          }
          else if isCollisionCharacterBottom(1,oGame.players[i])
          {
            with oGame.players[i]
              collision=isCollisionBottom(1)
            if oGame.players[i].collision
            {
              breakNow = 1
              break
            }
            oGame.players[i].y+=1
          }
        }
        if breakNow
          break
      }
    }
    //solid is moving up
    if yVelInteger<0
    {
      breakNow=0    //whether we should break out of the movement loop because the character is stuck
      for(y=y;y>mstYPrev+yVelInteger;y-=1)
      {
        for(i=0;i<oGame.players_length;i+=1)
        {
          //push the character up regardless of the viscid properties of the solid top
          if isCollisionCharacterTop(1,oGame.players[i])
          { 
            with oGame.players[i]
              collision=isCollisionTop(1)
            if oGame.players[i].collision
            {
              breakNow = 1
              break
            }
            oGame.players[i].y-=1
          }
          if isCollisionCharacterBottom(1,oGame.players[i])
          {
            //variable jumping causes the character to get stuck to the bottom of a moving solid
            //that is moving faster than 1 pixel per step upwards, so we need this code
            if oGame.players[i].jumpTime<oGame.players[i].jumpTimeTotal
            {
              oGame.players[i].yVel=-2
              oGame.players[i].jumpTime=oGame.players[i].jumpTimeTotal
            }
          }
        }
        if breakNow
          break
      }
    }
    with oCharacter
    {
      if viscidMovementOk=2
        viscidMovementOk=0
    }
  }
  else
  {
    x+=xVelInteger
    y+=yVelInteger
  }
  
  /*
    if (place_meeting(x,y+1,oItem))
    {
        yVel = 0;
        myGrav = 0;
        // break;
    }
    else
    {
        myGrav = 1;
    }
  */
}
//finished oMovingSolid code
//accelerates the oMoveableSolid objects downwards
with oMoveableSolid
{
    if ((x > view_xview[0]-16 and x < view_xview[0] + view_wview[0] and
        y > view_yview[0]-16 and y < view_yview[0] + view_hview[0]))
    {
        yMPrev = y;
        yVel += myGrav;
        if (yVel > 8) yVel = 8;
        //yVel+=oGame.moveableSolidGrav
        //moves the moveable solid down
        for (y = y; y < yMPrev + yVel; y += 1)
        {
        //if there is a collision with a solid or the character one pixel below the moveable solid, we want it to stop
        //is there a (precise) collision
            if (place_meeting(x, y+1, oSolid)) // or isCollisionCharacterBottom(2))
            {
                if (yVel > myGrav) playSound(global.sndThud);
                yVel = 0;
                break;
            }
            
            //scrMoveableSolidRecurseDrop();
            /*
            obj = 0;
            obj = instance_place(x, y-1, oEnemy);
            if (obj) obj.y += 1;
            obj = 0;
            obj = instance_place(x, y-1, oItem);
            if (obj) obj.y += 1;
            obj = 0;
            obj = instance_place(x, y-1, oTreasure);
            if (obj) obj.y += 1;
            obj = 0;
            */
        }
    }
}}
