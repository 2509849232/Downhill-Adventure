if (instance_exists(obj_player)) {
	direction = point_direction(obj_player.x,obj_player.y,mouse_x,mouse_y);
	image_angle = direction;
}

speed = 10