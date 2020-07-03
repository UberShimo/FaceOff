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

// Controls
global.P1_Forward = ord("D");
global.P1_Backward = ord("A");
global.P1_Down = ord("S");
global.P1_Up = ord("W");
global.P1_Attack = ord("B");
global.P1_Special = ord("N");
global.P1_Block = ord("M");

global.P2_Forward = vk_left;
global.P2_Backward = vk_right;
global.P2_Down = vk_down;
global.P2_Up = vk_up;
global.P2_Attack = vk_numpad1;
global.P2_Special = vk_numpad2;
global.P2_Block = vk_numpad3;

global.GP_Down = gp_padd;
global.GP_Up = gp_padu;
global.GP_Attack = gp_face3;


global.P1_pick = noone;
global.P2_pick = noone;
global.CPU_pick = noone;

global.duelHasStarted = false;


randomize();

room_goto(Menu);