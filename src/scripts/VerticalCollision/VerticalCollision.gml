function VerticalCollision(x,y,vsp,collision_mask){
	if (place_meeting(x,y+vsp,collision_mask)) {
		while (!place_meeting(x,y+sign(vsp),collision_mask)) {
			y = y + sign(vsp);
		}
	return vsp = 0;
	} else {
		return vsp;
	}
}