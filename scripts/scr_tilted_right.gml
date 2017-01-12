/// Determine if the device is tilted to the right
var tilt = 0
if display_get_orientation() = display_landscape 
{
   tilt += device_get_tilt_y();
}
if display_get_orientation() = display_portrait
{
   tilt += device_get_tilt_x();
}
if display_get_orientation() =  display_landscape_flipped
{
   tilt -= device_get_tilt_y();
}

if(sign(tilt) > 0 and tilt > 0.08)
    return true
else
    return false
