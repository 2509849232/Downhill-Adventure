if (playerAngle < 180) {
	with (other) {
		vsp -= 22;
	}
	instance_destroy(ref);
	instance_destroy();
}