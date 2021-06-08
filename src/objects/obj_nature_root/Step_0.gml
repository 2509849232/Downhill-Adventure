if (instance_exists(obj_player)) {
	x = obj_player.x;
	y = obj_player.y - 32;
	
}


if (size < 15 && retract == false) {
	size += 1;
	image_xscale += .3;
} else {
	retract = true;
}

if (retract) {
	image_xscale -= .3;
}

if (image_xscale <= 0) {
	instance_destroy();
}
