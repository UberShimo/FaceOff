global.startUp_A = 10;
global.startUp_B = 16;
global.startUp_C = 24;

/*
recovery_A+ = 16; Rarely used
recovery_A = 24;
recovery_B = 32;
recovery_C = 40;
*/

global.hitStun_A = 0; // launch
global.hitStun_B = 36;
global.hitStun_C = 28;
global.hitStun_D = 20; // Rarely used

global.blockStun_A = 36;
global.blockStun_B = 28;
global.blockStun_C = 20;
global.blockStun_D = 12; // Rarely used

global.hitPush_A = 0; // launch
global.hitPush_B = 2;
global.hitPush_C = 1;

global.blockPush_A = 3;
global.blockPush_B = 2;
global.blockPush_C = 0;

//Settings
global.bufferAmount = 8;
global.hitboxDuration = 4;
global.gravityValue = 0.2;

// Picks
global.P1_pick = noone;
global.P2_pick = noone;
global.CPU_pick = noone;

global.duelHasStarted = false;


randomize();

room_goto(Menu);