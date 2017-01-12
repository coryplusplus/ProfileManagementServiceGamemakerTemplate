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
// argument6 is walk sprite
// argument7 is idle sprite
//
// This script will if placed in the step event
// generate a correct movement in a platform game
// all solid objects are ground
// replace //sprite_index := ...; discription with:
// sprite_index := the sprite matching the discription;
//
///////////////////////////////////////////////////// 

if(scr_isMobile())
{
    scr_move_mobile(argument0,argument1,argument2,argument3,argument4,argument5, argument6, argument7, argument8, argument9)
}
else
{
character = argument5;
spr_walk = argument6
spr_idle = argument7
spr_up = argument8
spr_down = argument9


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
  
if !keyboard_check(vk_left) and !keyboard_check(vk_right) and !(keyboard_check(vk_space) || global.jumping) and !keyboard_check(vk_down) and !keyboard_check(vk_up) and vspeed = 0 then
  {//If nothing is happening
      sprite_index = global.spr_idle;
      image_speed = .3
  }
gravity := argument2;

  if keyboard_check(vk_down) and (not (keyboard_check(vk_space) || global.jumping) ) then
  {//if moving right and not flying
  for (i = 0; i<= 8; i += 1;)
    {//check to see if you are goin up a ramp
    if place_free(x + argument0,y+i)
      {
      image_speed = .7;
      image_xscale = 1;
      if(sprite_index != spr_down)
      {
       sprite_index = spr_down;
      }
       if(keyboard_check(vk_right))
       {
            x += argument0
       }
       if(keyboard_check(vk_left))
       {
            x -= argument0
       }
      y += argument0; exit;
      }
    }
  }
    if keyboard_check(vk_up) and (not (keyboard_check(vk_space) || global.jumping)) then
  {//if moving right and not flying
  for (i = 0; i<= 8; i += 1;)
    {//check to see if you are goin up a ramp
    if place_free(x + argument0,y-i)
      {
      image_speed = .7;
      image_xscale = 1;
      if(sprite_index != spr_up)
      {
       sprite_index = spr_up;
       }
       if(keyboard_check(vk_right))
       {
            x += argument0
       }
       if(keyboard_check(vk_left))
       {
            x -= argument0
       }
      y -= argument0; exit;
      }
    }
  }
if (vspeed >= 0 && not place_free(x,y + vspeed + 1)) then
  {//if falling and there's ground below you
  move_contact_solid(270,vspeed + 1);
  vspeed = 0;
  gravity := 0;
  }
if keyboard_check(vk_left) and (not (keyboard_check(vk_space) || global.jumping)) then
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
  if place_free(x-argument0,y + vspeed + argument2) and keyboard_check(vk_left) then
    {
    x := x-argument0;
    image_speed = .1;
    image_xscale = -1;
     sprite_index = global.spr_jump;
    }
  }
if keyboard_check(vk_right) and (not (keyboard_check(vk_space) || global.jumping)) then
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
  if place_free(x + argument0,y + vspeed + argument2) and keyboard_check(vk_right)  then
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
  if ((keyboard_check(vk_space) || global.jumping)) then
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
  if (keyboard_check(vk_down)) then
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
  if (keyboard_check(vk_space) || global.jumping) and !place_free(x,y + 1){
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
  
  }
