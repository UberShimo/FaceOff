HP = 100;
guard = 100;
maxGuard = 100;
h_speed = 0; // My own speed controller
v_speed = 0; // My own speed controller
ms = 1.5; // Movement Speed

blocking = false;
ducking = false;
aerial = false;

Abuffer = 0;
Sbuffer = 0;
Dbuffer = 0;

action = "none";
bleed = 0; // Knives related

// Sprite init
hitSprite = noone;
launchSprite = noone;
riseSprite = noone;
blockStunStandingSprite = noone;
blockStunCrouchingSprite = noone;
guardBreakSprite = noone;
deadSprite = noone;
victorySprite = noone;