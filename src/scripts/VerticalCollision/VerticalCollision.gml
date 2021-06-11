function VerticalCollision(obj,vsp,collision_mask){
	if (place_meeting(obj.x,obj.y+vsp,collision_mask)) {
		while (!place_meeting(obj.x,obj.y+sign(vsp),collision_mask)) {
			obj.y = obj.y + sign(vsp);
		}
	return vsp = 0;
	} else {
		return vsp;
	}
}