import random

f = open('../level_easy.txt', 'rb')
content = f.read()
f.close()

out = '    BYTE '

empty_c = 0
for c in content:
	if (c == 48):
		empty_c += 1
	else:
		if(empty_c == 1):
			out += "Q_NEXT, "
		elif(empty_c > 1):
			out += "Q_REPEAT_X + {}, ".format(empty_c - 1)
		empty_c = 0
		#color = random.randint(0, 5)
		color = (random.randint(0, 1) and 5) or 0
		if(color == 0):
			color = "B_WHITE"
		elif(color == 1):
			color = "B_PURPLE"
		elif(color == 2):
			color = "B_BLUE"
		elif(color == 3):
			color = "B_GREEN"
		elif(color == 4):
			color = "B_YELLOW"
		elif(color == 5):
			color = "B_RED"
		lane = random.randint(0, 2)
		out += "({} + LEN_B_COLORS * {}), Q_NEXT, ".format(color, lane)

		if len(out) > 40:
			print(out[0:-2])
			out = '    BYTE '
if (len(out) > 9):
	print(out[0:-2])
print("    BYTE Q_EOG")