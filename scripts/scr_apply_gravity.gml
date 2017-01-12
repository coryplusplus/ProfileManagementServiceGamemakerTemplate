if (vspeed >= 0 && not place_free(x,y + vspeed + 1)) then
  {//if falling and there's ground below you
  move_contact_solid(270,vspeed + 1);
  vspeed = 0;
  gravity := 0;
  }
