import matplotlib.pyplot as plt
import numpy as np

x = []
y = []
x1 = []
y1 = []
x2 = []
y2 = []

with (open("tarefa-4-saida-1.out")) as arq:
    while True:
        try:
            line = arq.readline().split()
            print(line)
            x.append(float(line[0]))
            y.append(float(line[1]))
        except:
            break


with (open("tarefa-4-saida-2.out")) as arq:
    while True:
        try:
            line = arq.readline().split()
            print(line)
            x1.append(float(line[0]))
            y1.append(float(line[1]))
        except:
            break

with (open("tarefa-4-saida-3.out")) as arq:
    while True:
        try:
            line = arq.readline().split()
            print(line)
            x2.append(float(line[0]))
            y2.append(float(line[1]))
        except:
            break


#plt.hist(x, 150)
plt.plot(x, y, '-', label = r"$\theta$")
plt.plot(x1, y1, '-', label = r"$\omega$")
plt.plot(x2, y2, '-', label = "Energia")
plt.xlabel(r"$\tau$")
plt.ylabel("")
plt.legend([r"$\theta$", r"$\omega$", "Energia"], bbox_to_anchor = (1.0, 0.6))
plt.grid(True)
plt.show()
