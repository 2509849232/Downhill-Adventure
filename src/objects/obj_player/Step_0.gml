// inputs
A = keyboard_check(ord("A")) || keyboard_check(vk_left);
D = keyboard_check(ord("D")) || keyboard_check(vk_right);
Space = keyboard_check_pressed(vk_space);
SpaceRelease = keyboard_check_released(vk_space);
mbLeft = mouse_check_button_pressed(mb_left);

switch(state) {
	case playerState.normal:
		var move = D - A;
		hsp = move * walkSpd;

		onFloor = CheckForFloor(8);

		// JUMP
		if (onFloor) {
			coyoteTime = 5;
			availableJumps = totalJumpsICanTake;
		}
		
		if (coyoteTime >= 0 && Space && availableJumps > 0
			|| Space && availableJumps > 0) 
		{
			availableJumps--
			vsp = jumpHeight;
		}
		
		if (availableJumps >= 0 && vsp < 0 && SpaceRelease) {
			vsp = vsp / 2;
		}
		
		coyoteTime -= 1;
		// END OF JUMP CODE
		
		vsp = AddGravity(vsp,grv);
		hsp = HorizonalCollision(self,hsp,collision_mask);
		vsp = VerticalCollision(self, vsp, collision_mask);
		
		vsp = clamp(vsp,-30,15);
		x = MoveHorizontal(x,hsp);
		y = MoveVertical(y,vsp);
	
		switch (currentWeapon) {
			case weapon.arcane_fireball:
				Casting(obj_arcane_fireball,delayAmount, 15);
			break;
			case weapon.nature_root:
				Casting(obj_nature_root,delayAmount, 15);
			break;
		}

		// Animation
		if (!casting) {
			if (!onFloor) {
			sprite_index = spr_player_jump;
			image_speed = 0;
			} else {
				image_speed = 1;
				if (hsp == 0) {
					sprite_index = spr_player_idle;
				} else {
					sprite_index = spr_player_run;
				}
			}
		}
		if (hsp != 0) image_xscale = PickSpriteDirection(hsp);

		// Reducing Casting Delay
		castingDelay -= 1;
	break;
	case playerState.dead:
		sprite_index = spr_player_dead;
	break;
}



