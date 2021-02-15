dmg = 0;
guardDmg = 0;
penetration = 0; // 0 = no pen > 1 = 100% pen
hitStun = 0;
hitPush = 0;
blockStun = 0;
blockPush = 0;
hitPause = 4;

type = "";
spawner = "";
bleed = 0; // Only used for Knives

launcher = false;
hLaunch = 0;
vLaunch = 0;

alarm[0] = global.hitboxDuration;

audio_play_sound(Swoosh_snd, 1, false);