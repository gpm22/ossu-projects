board = []

for index, x in enumerate(board):
    print(x, end = ' ')
    counter = index + 1
    if counter%3 == 0:
        print("|", end = ' ')
    if counter%9 == 0:
        print("")
    if counter%27 == 0:
        print("-----------------------")
