// Inherit the parent event
event_inherited();

maxGuard = 100;
guard = 100;
Dbuffer = 0;

hitSprite = Knives_Hit_Spr;
launchSprite = Knives_Launched_Spr;
riseSprite = Knives_Rise_Spr;
blockStunStandingSprite = Knives_BlockStunned_Standing_Spr;
blockStunCrouchingSprite = Knives_BlockStunned_Ducking_Spr;
guardBreakSprite = Knives_GuardBreak_Spr;
deadSprite = Knives_Dead_Spr;

hasTeleport = true;

Forward = false;
Backward = false;
Down = false;
Up = false;
Attack = false;
Special = false
Block = false;

alarm[10] = 120;