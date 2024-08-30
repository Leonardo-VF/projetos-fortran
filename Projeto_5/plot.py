import matplotlib.pyplot as plt

x = []
y = []
x1 = []
y1 = []
x2 = []
y2 = []

with (open("tarefa-1-saida-3.out")) as arq:
    while True:
        try:
            line = arq.readline().split()
            print(line)
            x.append(float(line[0]))
            y.append(float(line[4]))
        except:
            break


with (open("tarefa-1-saida-3.out")) as arq:
    while True:
        try:
            line = arq.readline().split()
            print(line)
            x1.append(float(line[0]))
            y1.append(float(line[-1]))
        except:
            break
'''
with (open("fortran/Projeto_4/tarefa-4-saida-1.out")) as arq:
    while True:
        try:
            line = arq.readline().split()
            print(line)
            v2.append(float(line[0]))
            d2.append(float(line[1]))
        except:
            break

'''

#plt.hist(x, 150)
plt.plot(x, y, '-', label = "EC")
plt.plot(x1, y1, '-', label = "Verlet")
#plt.plot(x2, y2, '-', label = "Energia")
plt.xlabel('')
plt.ylabel('')
plt.legend(["EC","Verlet"], bbox_to_anchor = (1.005, 0.6))
plt.grid(True)
plt.show()
