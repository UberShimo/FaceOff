// Inherit the parent event
event_inherited();

maxGuard = 100;
guard = 100;
Dbuffer = 0;

hitSprite = Rapier_Hit_Spr;
launchSprite = Rapier_Launched_Spr;
riseSprite = Rapier_Rise_Spr;
blockStunStandingSprite = Rapier_BlockStunned_Standing_Spr;
blockStunCrouchingSprite = Rapier_BlockStunned_Ducking_Spr;
guardBreakSprite = Rapier_GuardBreak_Spr;
deadSprite = Rapier_Dead_Spr;
victorySprite = Rapier_Stand_Spr;

Forward = false;
Backward = false;
Down = false;
Up = false;
Attack = false;
Special = false
Block = false;

alarm[10] = 120;