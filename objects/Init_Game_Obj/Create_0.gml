global.startUp_A = 10;
global.startUp_B = 16;
global.startUp_C = 24;

/*
recovery_A+ = 24; Rarely used
recovery_A = 32;
recovery_B = 40;
recovery_B = 48;
*/

global.hitStun_A = 666; // launch (needs to be above 0 so its not treated as NO HITSTUN)
global.hitStun_B = 36;
global.hitStun_C = 28;
global.hitStun_D = 20; // Rarely used

global.blockStun_A = 36;
global.blockStun_B = 28;
global.blockStun_C = 20;
global.blockStun_D = 12; // Rarely used

global.hitPush_A = 3;
global.hitPush_B = 1.5;
global.hitPush_C = 0.5;

global.blockPush_A = 3;
global.blockPush_B = 2;
global.blockPush_C = 0;

//Settings
global.bufferAmount = 12;
global.hitboxDuration = 4;
global.gravityValue = 0.15;
global.worldSpeed = 1;

// Picks
global.P1_pick = noone;
global.P2_pick = noone;
global.CPU_pick = noone;

global.duelHasStarted = false;

global.GP1_index = 0;
global.GP2_index = 1;

randomize();

room_goto(Menu);