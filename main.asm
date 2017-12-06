INCLUDE ..\Irvine32.inc

.data

; PONCUTATIONS
P_PURPLE = 10
P_BLUE = 20
P_GREEN = 30
P_YELLOW = 50
P_RED = 80

; ENUM: Bricks
B_GRAY = 0
B_PURPLE = 1
B_BLUE = 2
B_GREEN = 3
B_YELLOW = 4
B_RED = 5
B_ANY = 6

; Game Constants
LEN_Q_LANES = 3 ; QUANTIDADES DE LANES
LAST_Q_COLORS = Q_BRICK+B_ANY+1
MAIN_TIME_STEP = 10; OUR DELAY TIME BETWEEN STEPS
BLOCKED_STEPS = 10 ; STEPS THE PLAYER WILL BE BLOCKED WHEN OVERFLOWED

; Enum: QueueElem
Q_BRICK = 0 ; LANE * Brick
Q_NEXT = LEN_Q_LANES*LAST_Q_COLORS ; ADVANCE STEP
Q_REPEAT_X = Q_NEXT+1 ; CREATE X EMPTY STEPS
Q_EOG = 255 ; END OF LEVEL

; Enum: InventoryElem
I_EMPTY = 0
I_REMOVING = 1
I_COLOR = 2

; Enum: PerLaneQueueElem
L_EMPTY = 0
L_EOG = 1
L_COLOR = 2

; Enum: Scenes
MAIN_START = 255
MAIN_TITLE = 254
MAIN_INSTRUCTIONS = 253
MAIN_PONCTUATION = 254

; GAME STATES
PLAYER_POS BYTE MAIN_START ; WHICH LANE (0..LEN_Q_LANES) OR WHICH SCENE (MAIN_START..MAIN_PONCTUATION)
MAIN_Q DWORD offset LEVEL_EASY ; CURRENT LEVEL QUEUE
MAIN_Q_INDEX BYTE 0	; CURRENT LEVEL QUEUE POSITION/INDEX
MAIN_Q_REPEAT_COUNTER BYTE 0 ; EMPTY STEPS LEFT COUNTER
PLAYER_BLOCKED_X BYTE 0 ; HOW MANY STEPS PLAYER WILL CONTINUE BLOCKED
PLAYER_INVENTORY BYTE LEN_Q_LANES DUP (7 DUP (I_EMPTY)) ; IVENTORY ON EACH LANE
PLAYER_POINTS DWORD 0 ; PONCUTATION ACCUMULATOR
GAME_LANES BYTE LEN_Q_LANES DUP (32 DUP (L_EOG)) ; WHAT WE HAVE QUEUED ON EACH LANE

; GLYPHS
GLYPH_PLAYER BYTE 3 DUP (178),254,0
GLYPH_PLAYER_EMPTY BYTE 4 DUP (' '),0
G_INV_EMPTY = 176
G_INV_NODE = 219
G_INV_SPLT = 175
G_LANE_BORDER = 205
G_LANE_SPLT = 196
G_FRAME = 254

; LEVELS
LEVEL_EASY BYTE Q_REPEAT_X+31,Q_EOG
LEVEL_NORMAL BYTE Q_REPEAT_X+31,Q_EOG

; TEXTS

TXT_TITLE BYTE
	88, G_FRAME, 1, 13, 1, 10,
	1, G_FRAME, 19, " ", 4, "_", 8, " ", 2, "_", 10, " ", 5, "_", 12, " ", 4, "_", 22, " ", 1, G_FRAME, 1, 13, 1, 10,
	1, G_FRAME, 18, " ", 1, "/", 1, " ", 2, "_", 1, " ", 1, ")", 2, "_", 2 , " ", 2, "_", 1, "/", 1 , " ", 1, "/", 4, "_", 5, " ", 1, "/", 1, " ", 3, "_",  1, "/", 2, "_", 2, " ", 7, "_", 1, "/", 1, " ", 2, "_", 1, "/", 2, "_", 2, " ", 5, "_", 13, " ", 1, G_FRAME, 1, 13, 1, 10,
	1, G_FRAME, 17, " ", 1, "/", 1, " ", 2, "_", 2, " ", 1, "/", 1, " ", 1, "/", 1, " ", 1, "/", 1, " ", 1, "/", 1, " ", 2, "_", 1, "/", 1, " ", 1, "_", 1, " ", 1, "\", 4, " ", 1, "\", 2, "_", 1, " ", 1, "\", 1, "/", 1, " ", 1, "/", 1, " ","/", 1, " ", 1, "/", 1, " ", 3,"_", 1, "/", 1, " ", 1, "/", 1, "_", 1, "/", 1, " ", 1, "_", 1, " ", 1, "\", 1, "/", 1, " ", 3, "_", 1, "/", 13,	" ", 1, G_FRAME, 1, 13, 1, 10,
	1, G_FRAME, 16, " ", 1, "/", 2, " ", 1, "/", 1, "_", 1, "/", 1, " ", 1, "/", 1, " ", 1, "/", 1, "_", 1, "/", 1, " ", 1, "/", 1, " ", 1, "/", 1, "_", 1, "/", 2, " ", 2, "_", 1, "/", 3, " ", 3, "_", 1, "/", 1, " ", 1, "/", 1, " ", 1, "/", 1, "_", 1, "/", 1, " ", 1, "/", 1, " ", 1, "/", 2, " ", 1, "/", 1, " ", 2, "_", 1, "/", 2, " ", 2, "_", 1, "/", 1, " ", 1, "/", 17, " ", 1, G_FRAME, 1, 13, 1, 10
	1, G_FRAME, 15, " ", 1, "/", 5, "_", 1, "/", 1, "\", 2, "_", 1, " ", 1, "/", 1, "\", 2, "_", 1, "/", 1, "\", 3, "_", 1, "/", 3, " ", 1, "/", 4, "_", 1, "/", 1, "\", 2, "_", 1, "_", 1, "/", 1, "_", 1, "/", 2, " ", 1, "/", 1, "_", 1, "/", 2, " ", 1, "\", 3, "_", 1, "/", 1, "_", 1, "/", 18, " ", 1, G_FRAME, 1, 13, 1, 10, 
	1, G_FRAME, 21, " ", 1, "/", 4, "_", 1, "/", 59, " ", 1, G_FRAME, 1, 13, 1, 10,                                                          ■ 
	1, G_FRAME, 86, " ", 1, G_FRAME, 1, 13, 1, 10, 
	1, G_FRAME, 86, " ", 1, G_FRAME, 1, 13, 1, 10,
	1, G_FRAME, 30, " ", 1, "P", 1, "R", 1, "E", 2, "S", 1, " ", 1, "F", 1, "1", 1, " ", 1, "F", 1, "O", 1, "R", 1, " ", 1, " ", 1, "I", 1, "N", 1, "S", 1, "T", 1, "R",  1, "U", 1, "C", 1, "T", 1, "I", 1, "O", 1, "N", 1, "S", 1, "!", 30, " ", 1, G_FRAME, 1, 13, 1, 10,
	1, G_FRAME, 28, " ", 1, "O", 1, "R", 1, " ", 1, "C", 1, "H", 1, "O", 1, "O", 1, "S", 1, "E", 1, " ", 1, "A", 1, " ", 1, "D", 1, "I", 1, "F", 1, "F", 1, "I", 1, "C", 1, "U", 1, "L", 1, "T", 1, "Y", 1, " ", 1, "T", 1, "O", 1, " ", 1, "P", 1, "L", 1, "A", 1, "Y", 1, ":", 27, " ", 1, G_FRAME, 1, 13, 1, 10,
	1, G_FRAME, 39, " ", 1, "1", 1, " ", 1, "-", 1, " ", 1, "E", 1, "A", 1, "S", 1, "Y", 39, " ", 1, G_FRAME, 1, 13, 1, 10,
	1, G_FRAME, 38, " ", 1, "2", 1, " ", 1, "-", 1, " ", 1, "N", 1, "O", 1, "R", 1, "M", 1, "A", 1, "L", 38, " ", 1, G_FRAME, 1, 13, 1, 10,
	1, G_FRAME, 39, " ", 1, "3", 1, " ", 1, "-", 1, " ", 1, "H", 1, "A", 1, "R", 1, "D", 39, " ", 1, G_FRAME, 1, 13, 1, 10,
	1, G_FRAME, 86, " ", 1, G_FRAME, 1, 13, 1, 10,
	1, G_FRAME, 86, " ", 1, G_FRAME, 1, 13, 1, 10,
	1, G_FRAME, 2, " ", 1, "C", 1, "r", 1, "e", 1, "a", 1, "t", 1, "e", 1, "d", 1, " ", 1, "b", 1, "y", 1, ":", 1, " ", 1, "B", 1, "i", 1, "a", 1, "n", 1, "c", 1, "a", 1, " ", 1, "G", 1, "a", 1, "r", 1, "c", 1, "i", 1, "a", 1, " ", 1, "M", 1, "a", 1, "r", 1, "t", 1, "i", 1, "n", 1, "s", 25, " ", 1, "L", 1, "A", 1, "B", 1, " ", 1, "A", 1, "R", 1, "Q", 1, "2", 18, " ", 1, G_FRAME, 1, 13, 1, 10,
	1, G_FRAME, 14, " ", 1, "P", 1, "e", 1, "d", 1, "r", 1, "o", 1, " ", 1, "H", 1, "e", 1, "n", 1, "r", 1, "i", 1, "q", 1, "u", 1, "e", 1, " ", 1, "L", 1, "a", 1, "r", 1, "a", 1, " ", 1, "C", 1, "a", 1, "m", 1, "p", 1, "o", 1, "s", 15, " ", 1, "P", 1, "r", 1, "o", 1, "f", 1, ".", 1, " ", 1, "L", 1, "u", 1, "c", 1, "i", 1, "a", 1, "n", 1, "o", 1, " ", 1, "N", 1, "e", 1, "r", 1, "i", 1, "s", 12, " ", 1, G_FRAME, 1, 13, 1, 10,
	1, G_FRAME, 14, " ", 1, "R", 1, "e", 1, "b", 1, "e", 2, "c", 1, "a", 1, " ", 1, "F", 1, "e", 1, "r", 1, "n", 1, "a", 1, "n", 1, "d", 1, "e", 1, "s", 30, " ", 1, "2", 1, "0", 1, "1", 1, "7", 1, "/", 1, "2", 19, " ", 1, G_FRAME, 1, 13, 1, 10,
	1, G_FRAME, 86, " ", 1, G_FRAME, 1, 13, 1, 10,
	88, G_FRAME, 1, 13, 1, 10,
	0

.code
main PROC
	invoke title
	exit
main ENDP

title PROC
	mov edx, offset TXT_TITLE
	call WriteString
	ret
title ENDP

END main