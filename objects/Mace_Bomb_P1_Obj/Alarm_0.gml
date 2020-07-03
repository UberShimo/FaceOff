sprite_index = Mace_Explosion_Spr;

hitbox = instance_create_depth(x, y, -5, Mace_Explosion_Hitbox_Obj);
hitbox.spawner = "P1";

alarm[9] = 12;