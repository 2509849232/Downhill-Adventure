// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function HorizonalCollision(x,y,hsp,collision_mask){
	if (place_meeting(x+hsp,y,collision_mask)) {
		while (!place_meeting(x+sign(hsp),y,collision_mask)) {
			x += sign(hsp);
		} 
		return hsp = 0;
	} else {
		return hsp;
	}
}
