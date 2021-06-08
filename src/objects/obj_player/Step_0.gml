A = keyboard_check(ord("A")) || keyboard_check(vk_left);
D = keyboard_check(ord("D")) || keyboard_check(vk_right);
Space = keyboard_check_pressed(vk_space);
mbLeft = mouse_check_button_pressed(mb_left);

var move = D - A;
hsp = move * walkSpd;
AddGravity();

onFloor = _CheckForFloor();

// JUMP
if (onFloor) {
	coyoteTime = 6;
	canJump = true;
}
coyoteTime -= 1;

if (coyoteTime >= 0 && Space && canJump) {
	vsp = -12;
	canJump = false;
}


HorizonalCollision();
VerticalCollision();
MoveToon();

// Casting
if (mbLeft && !casting && castingDelay < 0) {
	sprite_index = spr_player_cast;
	casting = true;
	alarm_set(0,8);
	castingDelay = delayAmount;
	
	var spell = instance_create_layer(x,y-50,"layer_spells",obj_arcane_fireball);
	with (spell) {
		direction = point_direction(x,y,mouse_x,mouse_y);
		speed = 10;
	}
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


