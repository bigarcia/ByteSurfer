.data
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
	BYTE 201,205,187,218,196,191,218,191,218,218,196,191,194,196,191,218,196,191,218,194,191,194,32,194,194,32,32,218,196,191,218,194,191,194,218,196,191,218,191,218,218,196,191, 0
	BYTE 186,32,32,179,32,179,179,179,179,179,32,194,195,194,217,195,196,180,32,179,32,179,32,179,179,32,32,195,196,180,32,179,32,179,179,32,179,179,179,179,192,196,191, 0
	BYTE 200,205,188,192,196,217,217,192,217,192,196,217,193,192,196,193,32,193,32,193,32,192,196,217,193,196,217,193,32,193,32,193,32,193,192,196,217,217,192,217,192,196,217, 0
LQ_POINTS = 3

TXT_MEDAL \
	BYTE "HERE'S A MEDAL FOR YOU:",0

TXT_REWARD_GOLD \
	BYTE 201,205,187,201,205,187,203,32,32,201,203,187, 0
	BYTE 186,32,203,186,32,186,186,32,32,32,186,186, 0
	BYTE 200,205,188,200,205,188,202,205,188,205,202,188, 0
LQ_REWARD_GOLD = 3

TXT_REWARD_SILVER \
	BYTE 201,205,187,203,203,32,203,32,32,203,201,205,187,203,205,187, 0
	BYTE 200, 205, 187,186,186,32,200,187,201,188,186,185,32,204,203,188, 0
	BYTE 200,205,188,202,202,205,188,200,188,32,200,205,188,202,200,205, 0
LQ_REWARD_SILVER = 3

TXT_REWARD_BRONZE \
	BYTE 201,187,32,203,205,187,201,205,187,201,187,201,201,205,187,201,205,187, 0
	BYTE 204,202,187,204,203,188,186,32,186,186,186,186,201,205,188,186,185, 0 
	BYTE 200,205,188,202,200,205,200,205,188,188,200,188,200,205,188,200,205,188, 0
LQ_REWARD_BRONZE = 3
               
TXT_PTS_0 \
	BYTE "YOU GOT ", 0

TXT_PTS_1 \
	BYTE " PTS.", 0
             
TXT_FINISH \
	BYTE "WANNA TRY AGAIN?", 0
	BYTE " Press ESC to quit.", 0
	BYTE " Press RETURN to go back to main menu.", 0
LQ_FINISH = 3

TXT_SIGNATURE \
	BYTE "[> BYTES SURFER <]",0

TXT_PTS_NOW \
	BYTE "POINTS:",0

TXT_DEBUG_BLOCKED BYTE "BLOCK: ",0
TXT_DEBUG_FPS BYTE "FPS: ",0
TXT_DEBUG_MATCH_CTR BYTE "MATCH CTR: ", 0
TXT_DEBUG_NEXT_EMPTY BYTE "EPTY RPT: ", 0