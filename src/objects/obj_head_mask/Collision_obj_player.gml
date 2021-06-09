if (playerAngle < 180) {
	with (other) {
		vsp = -12;
	}
	instance_destroy(ref);
	instance_destroy();
}