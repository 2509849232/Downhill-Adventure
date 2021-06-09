AddGravity();

switch (state) {
	case treeState.patrol:
		HorizonalCollision();
		VerticalCollision();
		MoveToon();
		PickSpriteDirection();
	break;
	case treeState.dead:
		sprite_index = spr_tree_dead;
		if (fadeOut) {
			image_alpha -= .05;
			if (image_alpha <= 0) instance_destroy();
		}
	break;
}
