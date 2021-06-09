if (state == treeState.dead) {
	image_speed = 0;
	image_index = 3;
	alarm_set(0,60);
	
	if (instance_exists(obj_player)) {
		obj_player.currentWeapon = weapon.nature_root;
	}
	
}