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
LEN_Q_LANES = 3 ; LANES NUMBER
LEN_B_COLORS = B_ANY+1 ; BRICK COLORS NUMBER
MAIN_TIME_STEP = 40; OUR DELAY TIME BETWEEN STEPS (miliseconds)
BLOCKED_STEPS = 10 ; STEPS THE PLAYER WILL BE BLOCKED WHEN OVERFLOWED

; Enum: QueueElem
Q_BRICK = 0 ; LANE * Brick
Q_NEXT = Q_BRICK+(LEN_Q_LANES*LEN_B_COLORS) ; ADVANCE STEP
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

; GAME STATES
PLAYER_POS BYTE ? ; WHICH LANE (0..LEN_Q_LANES)
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

; METAS
META_EASY_TITLE BYTE "Musica Bahiana", 0
META_EASY_ARTIST BYTE "Pedro", 0
META_EASY_YEAR DWORD 1995
;META_NORMAL
;META_HARD

; TEXTS
TXT_LOGO \
	BYTE "    ____        __          _____            ____", 0
	BYTE "   / __ )__  __/ /____     / ___/__  _______/ __/__  _____", 0
	BYTE "  / __  / / / / __/ _ \    \__ \/ / / / ___/ /_/ _ \/ ___/", 0
	BYTE " / /_/ / /_/ / /_/  __/   ___/ / /_/ / /  / __/  __/ /", 0
	BYTE "/_____/\__, /\__/\___/   /____/\__,_/_/  /_/  \___/_/", 0
	BYTE "      /____/", 0
LQ_LOGO = 6

TXT_TITLE_MIDDLE \
	BYTE "  PRESS F1 FOR INSTRUCTIONS!",0
	BYTE "OR CHOOSE A DIFFICULTY TO PLAY:",0
	BYTE "           1 - EASY",0
	BYTE "          2 - NORMAL",0
	BYTE "           3 - HARD",0
LQ_TITLE_MIDDLE = 5

TXT_AUTHORS \
	BYTE "Created by: Bianca Garcia Martins                         LAB ARQ2", 0
	BYTE "            Pedro Henrique Lara Campos               Prof. Luciano Neris", 0
	BYTE "            Rebecca Fernandes                              2017/2", 0
LQ_AUTHORS = 3

TXT_INSTRUCTIONS \
	BYTE "INSTRUCTIONS:", 0
	BYTE 0
	BYTE "  Press the UP and DOWN keys to move your spaceship across the roadway.", 0
	BYTE 0
	BYTE "  Earn points collecting bricks forming clusters of the same colors.", 0
	BYTE 0
	BYTE "  The bigger is the cluster and the hotter its color then more points will be", 0
	BYTE "  received.", 0
	BYTE 0
	BYTE "  If you get tired of playing, press ESC to return to title screen.", 0
	BYTE 0
	BYTE "  The level ends when the music stops!", 0
	BYTE 0
	BYTE "  In the title screen you need to choose a difficulty and press the number rela- ", 0
	BYTE "  ted to your choise.", 0
	BYTE 0
	BYTE 0
	BYTE "                                                Press RETURN to return...", 0
LQ_INSTRUCTIONS = 18

TXT_POINTS \
	BYTE 201,205,187,218,196,191,218,191,218,218,196,191,194,196,191,218,196,191,218,194,191,194," ",194,194," "," ",218,196,191,218,194,191,194,218,196,191,218,191,218,218,196,191, 0
	BYTE 186," "," ",179," ",179,179,179,179,179," ",194,195,194,217,195,196,180," ",179," ",179," ",179,179," "," ",195,196,180," ",179," ",179,179," ",179,179,179,179,192,196,191, 0
	BYTE 200,205,188,192,196,217,217,192,217,192,196,217,193,192,196,193," ",193," ",193," ",192,196,217,193,196,217,193," ",193," ",193," ",193,192,196,217,217,192,217,192,196,217, 0
LQ_POINTS = 3

TXT_MEDAL \
	BYTE "HERE'S A MEDAL FOR YOU:",0
LQ_MEDAL = 1

TXT_REWARD_GOLD \
	BYTE 201, 205, 187, 201, 205, 187, 203, "  ", 201, 203, 187, 0
	BYTE 186, " ", 203, 186, " ", 186, 186, "   ", 186, 186, 0
	BYTE 200, 205, 188, 200, 205, 188, 202, 205, 188, 205, 202, 188, 0
LQ_REWARD_GOLD = 3
                 
TXT_PTS \
	BYTE "YOU GOT ", 0
	BYTE " PTS.", 0
LQ_PTS = 2
             
TXT_FINISH \
	BYTE "WANNA TRY AGAIN?", 0
	BYTE " Press ESC to quit.", 0
	BYTE " Press SPACE to replay.", 0
	BYTE " Press RETURN to go back to title screen.", 0
LQ_FINISH = 4

; BUFFERS
LAST_STEP DWORD ?
VSYNC BYTE 25 DUP (90 DUP (?))
BF_DEFAULT_FRAMED BYTE \
	88 DUP (G_FRAME), 13, 10,
	20 DUP (G_FRAME, 86 DUP (" "), G_FRAME, 13, 10),
	88 DUP (G_FRAME), 0
BF_DEFAULT_EMPTY BYTE 22 DUP (88 DUP (" "), 13, 10), 0

.code

ClipText PROC USES eax ebx ecx edx, src: PTR BYTE, lines: DWORD, sx: DWORD, sy: DWORD
	mov ebx, src
	mov ecx, lines

	mov edx, sy
	imul edx, edx, 90	
	add edx, sx
	add edx, offset VSYNC
	push edx

ClipTextChar:
	movzx eax, BYTE PTR [ebx]
	add ebx, 1
	test al, al
	je ClipTextLine
	mov BYTE PTR [edx], al
	add edx, 1
	jmp ClipTextChar

ClipTextLine:
	pop edx
	add edx, 90
	push edx
	sub ecx, 1
	cmp ecx, 0
	je ClipTextFinish
	jmp ClipTextChar

ClipTextFinish:
	ret
ClipText ENDP

WaitStep PROC USES eax ebx
	mov ebx, MAIN_TIME_STEP

	; Get elapsed time
	call GetMseconds
	sub eax, LAST_STEP

	; Subtract elapsed time from default step
	sub ebx, eax

	; If negative do not wait step
	bt ebx, 31
	jc JumpSleep

	; Wait (default step - elapsed time)
	INVOKE Sleep, ebx

JumpSleep:
	; Save current time to calculate elapsed later on
	call GetMseconds
	mov LAST_STEP, eax

	ret
WaitStep ENDP

HelpScreen PROC USES eax edx
	INVOKE Str_copy,
		offset BF_DEFAULT_FRAMED,
		offset VSYNC
	
	INVOKE ClipText, offset TXT_INSTRUCTIONS, LQ_INSTRUCTIONS, 4, 2
	
	call Clrscr
	mov edx, offset VSYNC
	call WriteString
	call ReadChar
	
	ret
HelpScreen ENDP

sGotoxy PROC USES edx row: BYTE, col: BYTE
	mov dl, col
	mov dh, row
	call Gotoxy
	ret
sGotoxy ENDP

Game PROC  USES eax ebx edx, level: PTR BYTE, _title: PTR BYTE, artist: PTR BYTE, year: DWORD
	call Clrscr
	
	INVOKE sGotoxy, 1, 4
	mov eax, red*16 + white
	call SetTextColor
	mov edx, _title
	call WriteString

	INVOKE sGotoxy, 2, 4
	mov eax, green*16 + white
	call SetTextColor
	mov edx, artist
	call WriteString

	INVOKE sGotoxy, 3, 4
	mov eax, blue*16 + white
	call SetTextColor
	mov eax, year
	call WriteDec
	
	mov eax, black*16 + white
	call SetTextColor
	
	mov ebx, level
	call ReadChar
	
	ret
Game ENDP

TitleScreen PROC USES eax edx
TitleStart: 
	INVOKE Str_copy,
		offset BF_DEFAULT_FRAMED,
		offset VSYNC
	
	INVOKE ClipText, offset TXT_LOGO, LQ_LOGO, 16, 1
	INVOKE ClipText, offset TXT_TITLE_MIDDLE, LQ_TITLE_MIDDLE, 29, 9
	INVOKE ClipText, offset TXT_AUTHORS, LQ_AUTHORS, 4, 16
	
	call Clrscr
	mov edx, offset VSYNC
	call WriteString

TitleWaitAction:

	call ReadKey
	
	cmp dx, VK_ESCAPE
	je TitleFinish

	cmp dx, VK_F1
	je TitleGoHelp

	cmp dx, 31h
	je TitleGoEasy

	cmp dx, 32h
	je TitleGoNormal

	cmp dx, 31h
	je TitleGoHard

	INVOKE WaitStep
	jmp TitleWaitAction

TitleGoEasy:
	INVOKE Game, offset LEVEL_EASY, offset META_EASY_TITLE, offset META_EASY_ARTIST, META_EASY_YEAR
	;jmp PoncutationScreen
TitleGoNormal:

TitleGoHard:

TitleGoHelp:
	INVOKE HelpScreen
	jmp TitleStart

TitleFinish:
	ret
TitleScreen ENDP

main PROC
	; Starts frame-sync timer
	call GetMseconds
	mov LAST_STEP, eax

	; First screen
	INVOKE TitleScreen

	; Bye
	exit
main ENDP

END main