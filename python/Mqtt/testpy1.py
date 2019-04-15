TABLICA = []
i = 0
r = 5
p = 2
q = 10


def zapis_do_listy(r, p, q):
    temp_tab = [int(r), int(p), int(q)]
    global TABLICA
    global i
    TABLICA = TABLICA + [0]
    TABLICA[i] = temp_tab
    i = i + 1


def wypisanie_z_listy():
    print("Wypisywanie wierszy ")
    for a in TABLICA:
        print(a)

r = input("Podaj wartość r: ")
p = input("Podaj wartość p: ")
q = input("Podaj wartość q: ")
for j in range(1, 10):
    zapis_do_listy(r, p, q)
    r = int(r) + 1
    q = int(q) - 1
z = input("czy zakonczyc? t/n")
w = input( "czy wyswietlic tablice t/n")
if w == 't' and z != 'n':
    wypisanie_z_listy()
else:
    print("Koniec")
print(TABLICA)