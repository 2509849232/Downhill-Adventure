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

		onFloor = _CheckForFloor();

		// JUMP
		if (onFloor) {
			coyoteTime = 6;
			canJump = true;
		}
		coyoteTime -= 1;

		if (coyoteTime >= 0 && Space && canJump) {
			vsp = -13;
			canJump = false;
		}
		
		if (canJump == false && vsp < 0 && SpaceRelease) {
			vsp = vsp / 2;
		} 
		// END OF JUMP CODE
		
		AddGravity();
		HorizonalCollision();
		VerticalCollision();
		MoveToon();
		
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


		PickSpriteDirection();

		// Reducing Casting Delay
		castingDelay -= 1;
	break;
	case playerState.dead:
		sprite_index = spr_player_dead;
	break;
}



