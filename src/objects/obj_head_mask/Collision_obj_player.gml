if (playerAngle < 180) {
	with (other) {
		vsp = -12;
	}
	ref.state = treeState.dead;
	instance_destroy();
}