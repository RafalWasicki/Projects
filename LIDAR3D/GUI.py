
import copy
import os

from pyface.qt import QtGui, QtCore

import threading
from tkinter import *
from tkinter import filedialog
from tkinter import ttk

import numpy as np
import plyfile
from mayavi import mlab

import Bledy_grube as bg
class wyswietl(threading.Thread):
    def __init__(self):
        threading.Thread.__init__(self)

    def run(self):
        mlab.show()


class wczytaj(threading.Thread):

    def __init__(self, nazwa):
        threading.Thread.__init__(self)
        self.value = nazwa

    def run(self):
        wczytywanie(self.value)





def wczytywanie(nazwa):
    global wczytano
    global wczytano_model
    global ptCloud
    data_vertex = plyfile.PlyData.read(nazwa)['vertex']
    try:
        if len(plyfile.PlyData.read(nazwa)['face'].data['vertex_indices']):
            wczytano_model = 1
        else:
            wczytano_model = 0
    except:
        wczytano_model = 0

    ptCloud = np.c_[data_vertex['x'], data_vertex['y'], data_vertex['z']]
    wczytano = True
    v.set("Wczytano")


# inicjalizacja
root = Tk()
root.title('Lidar 3D')
root.geometry("600x400")
# zmienne globalne
ptCloud = []
nazwa_pliku = []
wczytano = False
do_wyswietlenia = []
path = os.path.dirname(os.path.abspath(__file__))
wczytano_model = 0


def mplik_otworz_322():
    global nazwa_pliku
    nazwa_pliku = path + "/Dane/pokoj_322/2chmury.ply"
    v.set("Wczytywanie")
    w = wczytaj(nazwa_pliku)
    w.start()


def mplik_otworz_PPG():
    global nazwa_pliku
    nazwa_pliku = path + "/Dane/PPG_fabryka/hala_cala_oczyszczona.ply"
    v.set("Wczytywanie")
    w = wczytaj(nazwa_pliku)
    w.start()



def mplik_otworz_kolo():
    global nazwa_pliku
    nazwa_pliku = path + "/Dane/sala_kola/sala_kola.ply"
    v.set("Wczytywanie")
    w = wczytaj(nazwa_pliku)
    w.start()



def mplik_otworz_salon():
    global nazwa_pliku
    nazwa_pliku = path + "/Dane/salon/TVISZAFKI.ply"
    v.set("Wczytywanie")
    w = wczytaj(nazwa_pliku)
    w.start()



def mplik_otworz_sypialnia():
    global nazwa_pliku
    nazwa_pliku = path + "/Dane/sypialnia/sypialnia_punkty.ply"
    v.set("Wczytywanie")
    w = wczytaj(nazwa_pliku)
    w.start()



def mplik_otworz_322m():
    global nazwa_pliku
    nazwa_pliku = path + "/Dane/pokoj_322/1_rekonstrukcja.ply"
    v.set("Wczytywanie")
    w = wczytaj(nazwa_pliku)
    w.start()



def mplik_otworz_kolom():
    global nazwa_pliku
    nazwa_pliku = path + "/Dane/sala_kola/sala_kola_rekonstrukcja.ply"
    v.set("Wczytywanie")
    w = wczytaj(nazwa_pliku)
    w.start()



def mplik_otworz_sypialniam():
    global nazwa_pliku
    nazwa_pliku = path + "/Dane/sypialnia/sypialnia_rekonstrukcja_podstawowa.ply"
    v.set("Wczytywanie")
    w = wczytaj(nazwa_pliku)
    w.start()



def mplik_otworz():
    global nazwa_pliku
    nazwa_pliku = filedialog.askopenfilename(filetypes=[("pliki ply", "*.ply")], title='Wybierz plik .ply', initialdir="D:\studia\LIDAR\Prezentacja")
    if nazwa_pliku.endswith('.ply'):
        v.set("Wczytywanie")
        w = wczytaj(nazwa_pliku)
        w.start()
    else:  # do poprawy
        print(" niepoprawny formaty pliku ")


def mbledy():
    global ptCloud
    l, unique, lista, ilosc = bg.segmentacja(ptCloud, int(sasiedztwo.get()))
    index = []

    ptCloud_2 = copy.deepcopy(ptCloud)
    print(np.size(ptCloud_2, 0))
    lista_indeksow = []
    for i, x in enumerate(unique):
        treeview.insert("", 'end', text="", values=[str(ilosc[i][0]), str(ilosc[i][1])])
        if ilosc[i][1] < int(ilosc_w_klastrze.get()):
            lista_indeksow.extend(lista[i])
    print(lista_indeksow)
    ptCloud_2 = np.delete(ptCloud_2, lista_indeksow, 0)
    # print(ptCloud_2)
    print(np.size(ptCloud_2, 0))
    mlab.points3d(ptCloud_2[:, 0], ptCloud_2[:, 1], ptCloud_2[:, 2], mode='point')
    m = wyswietl()
    m.start()


def mplik_zapisz():
    global ptCloud
    file1 = filedialog.asksaveasfile(mode='w', defaultextension=".txt")
    if file1 is None:
        return
    c = np.savetxt(file1, ptCloud, delimiter=' ', fmt='%5.3f')
    # plyfile.PlyData.write()


def mroot_wyswietl():
    global ptCloud
    global scena
    global wczytano_model
    if wczytano:
        if wczytano_model:
            mlab.pipeline.surface(mlab.pipeline.open(nazwa_pliku))
            m = wyswietl()
            m.start()
        else:
            mlab.points3d(ptCloud[:, 0], ptCloud[:, 1], ptCloud[:, 2], mode='point')
            m = wyswietl()
            m.start()
    else:
        print("nie wczytano pliku")


# Menu
menu = Menu(root)
root.config(menu=menu)
treeview = ttk.Treeview(root, columns=['ID klastra', 'ilość punktów'])
subMenu = Menu(menu)
menu.add_cascade(label="Plik", menu=subMenu)
subMenu.add_command(label="Otwórz", command=mplik_otworz)
subMenu.add_command(label="Zapisz", command=mplik_zapisz)
chmuryMenu = Menu(menu)
menu.add_cascade(label="Przykłady - chmury", menu=chmuryMenu)
chmuryMenu.add_command(label="Sala 322", command=mplik_otworz_322)
chmuryMenu.add_command(label="Hala PPG", command=mplik_otworz_PPG)
chmuryMenu.add_command(label="Sala Koła", command=mplik_otworz_kolo)
chmuryMenu.add_command(label="Salon", command=mplik_otworz_salon)
chmuryMenu.add_command(label="Sypialnia", command=mplik_otworz_sypialnia)
modeleMenu = Menu(menu)
menu.add_cascade(label="Przykłady - modele", menu=modeleMenu)
modeleMenu.add_command(label="Sala 322", command=mplik_otworz_322m)
modeleMenu.add_command(label="Sala Koła", command=mplik_otworz_kolom)
modeleMenu.add_command(label="Sypialnia", command=mplik_otworz_sypialniam)
v = StringVar()
# tramka = Text(root, height=2, width=60)
t1 = Label(root, text="Rozmiar sąsiedztwa (cm)")
t2 = Label(root, text="minimalna ilość sąsiadów")
t3 = Label(root, textvariable=v)

sasiedztwo = Entry(root)
sasiedztwo.insert(0, "10")

ilosc_w_klastrze = Entry(root)
ilosc_w_klastrze.insert(0, "20")
button1 = Button(text='Wyświetl', width=30, command=mroot_wyswietl)
button2 = Button(text='Usuń błędy grube', width=30, command=mbledy)
t1.pack()
sasiedztwo.pack()
t2.pack()
ilosc_w_klastrze.pack()
button1.pack()
t3.pack()
button2.pack()
# tramka.pack()
treeview.pack(side=TOP, fill=X)
root.mainloop()
