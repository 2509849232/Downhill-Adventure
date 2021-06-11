function HorizonalCollision(obj,hsp,collision_mask){
	if (place_meeting(obj.x+hsp,obj.y,collision_mask)) {
		while (!place_meeting(obj.x+sign(hsp),obj.y,collision_mask)) {
			obj.x += sign(hsp);
		} 
		return hsp = 0;
	} else {
		return hsp;
	}
}
