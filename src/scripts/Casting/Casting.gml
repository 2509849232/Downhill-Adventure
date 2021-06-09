// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Casting(spellType, delay, animCastingDuration){
	if (mbLeft && !casting && castingDelay < 0) {
		sprite_index = spr_player_cast;
		casting = true;
		alarm_set(0,animCastingDuration);
		castingDelay = delay;
		instance_create_layer(x,y-50,"layer_spells",spellType);
	}
}