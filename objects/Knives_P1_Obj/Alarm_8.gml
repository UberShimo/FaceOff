/// @description Bleed hitbox

instance_create_depth(Player2_Obj.x, y, -3, Blood_Obj);
hitbox = instance_create_depth(Player2_Obj.x, y, 0, Knives_Bleed_Hitbox_Obj);
hitbox.spawner = "P1";