A = keyboard_check(ord("A")) || keyboard_check(vk_left);
D = keyboard_check(ord("D")) || keyboard_check(vk_right);
Space = keyboard_check_pressed(vk_space);
mbLeft = mouse_check_button_pressed(mb_left);

var move = D - A;
hsp = move * walkSpd;
vsp += grv;

// Check for Floor
if (place_meeting(x,y+1,obj_wall) && Space) {
	vsp += -12;
}

// Hor Colls
if (place_meeting(x+hsp,y,obj_wall)) {
	while (!place_meeting(x+sign(hsp),y,obj_wall)) {
		x = x + sign(hsp);
	}
	hsp = 0;
}

x += hsp;

// Vert Colls
if (place_meeting(x,y+vsp,obj_wall)) {
	while (!place_meeting(x,y+sign(vsp),obj_wall)) {
		y = y + sign(vsp);
	}
	vsp = 0;
}

y += vsp;

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
	if (!place_meeting(x,y+1,obj_wall)) {
	sprite_index = spr_player_jump;
	image_speed = 0;
}
else {
	image_speed = 1;
	if (hsp == 0) {
		sprite_index = spr_player_idle;
	} else {
		sprite_index = spr_player_run;
	}
}
}


if (hsp != 0) image_xscale = sign(hsp);

// Reducing Casting Delay
castingDelay -= 1;


