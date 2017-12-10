import random

dif = 'normal'
f = open('../level_'+dif+'.txt', 'rb')
content = f.read()
f.close()

out = '    BYTE '

def colorFromDec(v):
	if(dif != 'normal' and v == 0):
		return "B_WHITE"
	elif(dif != 'normal' and v == 1):
		return "B_PURPLE"
	elif(dif != 'normal' and v == 2):
		return "B_BLUE"
	elif(v == 3):
		return "B_GREEN"
	elif(v == 4):
		return "B_YELLOW"
	elif(v == 5):
		return "B_RED"
	else:
		return ""

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
		if dif == "easy":
			color = colorFromDec((random.randint(0, 1) and 5) or 0)
			lane = random.randint(0, 2)
			out += "({} + LEN_B_COLORS * {}), Q_NEXT, ".format(color, lane)

			if len(out) > 40:
				print(out[0:-2])
				out = '    BYTE '
		else:
			lucky = random.randint(0, 2)
			lanes =  [ random.randint(0, 10),
				random.randint(0, 10),
				random.randint(0, 10)
			]
			lanes[lucky] = random.randint(0, 5)

			for l_i in range(0, len(lanes)):
				b = colorFromDec(lanes[l_i])
				if(len(b) > 1):
					out += "({} + LEN_B_COLORS * {}), ".format(b, l_i)

			out += "Q_NEXT"
			print(out)
			out = '    BYTE '
if (len(out) > 9):
	print(out[0:-2])
print("    BYTE Q_EOG")