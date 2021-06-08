// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function VerticalCollision(){
	if (place_meeting(x,y+vsp,collision_mask)) {
		while (!place_meeting(x,y+sign(vsp),collision_mask)) {
			y = y + sign(vsp);
		}
	vsp = 0;
	}
}