//////////////// Platform movement engine ////////////////////
//
// Copyright Simon Donkers 3-7-2006
// www.simondonkers.com - gmmentor@simondonkers.com
//
// the arguments are: behind is recommandable value
// argument0 is horizontal speed 4
// argument1 is jump speed 10
// argument2 is gravity 0.3
// argument3 is speed on ladder 3
// [argument4 is object ladder ? (optional)]
// argument5 is character type
//
// This script will if placed in the step event
// generate a correct movement in a platform game
// all solid objects are ground
// replace //sprite_index := ...; discription with:
// sprite_index := the sprite matching the discription;
//
/////////////////////////////////////////////////////
character = argument5;
spr_walk = argument6;
spr_idle = argument7;
spr_up = argument8;
spr_down = argument9;


    global.spr_idle = spr_idle;
    global.spr_jump = spr_walk;
    global.spr_walk = spr_walk;
    global.spr_run = spr_walk;
    global.spr_fall = spr_walk;
    global.spr_climb = spr_walk;
if vspeed!= 0 then
  {
  image_speed = .05
  sprite_index = global.spr_fall;
  }
  
  //TODO : !tilted up and !tilted down
if !scr_tilted_left() and !scr_tilted_right() and !global.jumping and !global.jumping and vspeed = 0 then
  {//If nothing is happening
      sprite_index = spr_idle;
      image_speed = .3
  }
gravity := argument2;
if (vspeed >= 0 && not place_free(x,y + vspeed + 1)) then
  {//if falling and there's ground below you
  move_contact_solid(270,vspeed + 1);
  vspeed = 0;
  gravity := 0;
  }
if scr_tilted_left() and (not global.jumping) then
  {//if moving left and not flying
  for (i = 0; i<= 8; i += 1;)
    {//check to see if you are goin up a ramp. 
    if place_free(x-argument0,y-i)
      {
      image_speed = .7;
      image_xscale = -1;
      sprite_index = global.spr_run;
      x-= argument0; y-= i; exit;
      }
    }
  }
else
  {//if moving left and flying
  if place_free(x-argument0,y + vspeed + argument2) and scr_tilted_left() then
    {
    x := x-argument0;
    image_speed = .1;
    image_xscale = -1;
     sprite_index = global.spr_jump;
    }
  }
if scr_tilted_right() and (not global.jumping) then
  {//if moving right and not flying
  for (i = 0; i<= 8; i += 1;)
    {//check to see if you are goin up a ramp
    if place_free(x + argument0,y-i)
      {
      image_speed = .7;
      image_xscale = 1;
       sprite_index = global.spr_run;
      x += argument0; y-= i; exit;
      }
    }
  }
else
  {//if moving right and flying
  if place_free(x + argument0,y + vspeed + argument2) and scr_tilted_right()  then
    {
    x := x + argument0;
    image_speed = .1;
    image_xscale = 1;
    sprite_index = global.spr_jump;
    }
  }
if (argument[4]!=0)
  {//if argument4, stair object is given
  if place_meeting(x,y,argument4) then
    {//if on a stair
    gravity = 0; vspeed = 0;
    sprite_index = global.spr_climb
    }
  if (global.jumping) then
    {//if moving up
    if place_meeting(x,y,argument4) then
      {//if moving up on a stair
      if place_free(x,y-argument3) y -= argument3;
        sprite_index = global.spr_climb;
      }
    else
      if place_free(x,y + 1) = false then
        {//if moving up not on a stair and on the ground
        vspeed = -argument1;
        sprite_index = global.spr_jump;
        }
    }
  if (global.jumping) then
    {//if moving down
    if place_meeting(x,y + argument3 + sprite_height-sprite_yoffset,argument4) and place_free(x,y + argument3) then
      {//if moving down on a stair and no ground below
      y := y + argument3;
      vspeed := 0;
      //sprite_index := ...; sprite climbing
      }
    else
      {
      if place_meeting(x,y + sprite_height-sprite_yoffset,argument4) then
        {//if moving down a stair with ground below
        move_contact_solid(270,argument3);
        vspeed := 0;
        }
      }
    }
  }
else //if argument4 (object stair) is not passed along
  if global.jumping and !place_free(x,y + 1){
    vspeed = -argument1; //jump
    sprite_index = global.spr_jump;
    }

if (not place_free(x,y-sprite_yoffset + vspeed)) then
  {//if not place free below the object
  vspeed := argument2;
  }
if (not place_free(x,y)) and place_free(x,y-1) then
  {//if stuck just below surface
  y := y-1;
  vspeed := 0;
  }
