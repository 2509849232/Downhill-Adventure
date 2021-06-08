x = ref.x;
y = ref.y - 128;

if (instance_exists(obj_player)) {
	playerAngle = point_direction(x,y,obj_player.x,obj_player.y);
}	
