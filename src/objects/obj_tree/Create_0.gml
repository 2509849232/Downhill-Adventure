casting = false;
castingDelay = 0;
delayAmount = 20;
var headMask = instance_create_layer(x,y,"layer_enemies",obj_head_mask);
with (headMask) {
	ref = other
}


state = treeState.patrol;
fadeOut = false;