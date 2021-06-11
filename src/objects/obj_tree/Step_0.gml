vsp = AddGravity(vsp,grv);

switch (state) {
	case treeState.patrol:
		hsp = HorizonalCollision(x,y,hsp,collision_mask);
		vsp = VerticalCollision(x,y,vsp,collision_mask);
		x = MoveHorizontal(x,hsp);
		y = MoveVertical(y,vsp);
		if (hsp != 0) image_xscale = PickSpriteDirection(hsp);
	break;
	case treeState.dead:
		sprite_index = spr_tree_dead;
		if (fadeOut) {
			image_alpha -= .05;
			if (image_alpha <= 0) instance_destroy();
		}
	break;
}
