from tkinter import filedialog

import numpy as np
import plyfile
import scipy.spatial as spatial
import threading

ptCloud = []




def mplik_otworz():
    global nazwa_pliku
    global wczytano
    nazwa_pliku = filedialog.askopenfilename(filetypes=[("pliki ply", "*.ply")], title='Wybierz plik .ply', initialdir="D:\studia\LIDAR\Prezentacja")
    if nazwa_pliku.endswith('.ply'):
        global ptCloud
        data_vertex = plyfile.PlyData.read(nazwa_pliku)['vertex']
        ptCloud = np.c_[data_vertex['x'], data_vertex['y'], data_vertex['z']]
        wczytano = True
    else:  # do poprawy
        print(" niepoprawny formaty pliku ")


def znajdzSasiadow(ptCloud, distance):
    point_tree = spatial.cKDTree(ptCloud)
    sasiedzi = point_tree.query_ball_tree(point_tree, distance)
    return sasiedzi


def segmentacja(ptCloud, distance):
    newLabel = 0
    rozmiar = np.size(ptCloud, 0)
    l = [0 for x in range(np.size(ptCloud, 0))]
    sasiedzi = znajdzSasiadow(ptCloud, distance)
    for i in range(0, rozmiar):

        for j in sasiedzi[i]:
            if l[j] > 0 and l[i] > 0:
                if l[j] > l[i]:
                    for idx, item in enumerate(l):
                        if item == l[j]:
                            l[idx] = l[i]
                elif (l[j] < l[i]):
                    for idx, item in enumerate(l):
                        if item == l[i]:
                            l[idx] = l[j]
            else:
                if l[j] > 0:
                    l[i] = l[j]
                elif l[i] > 0:
                    l[j] = l[i]
        if l[i] == 0:
            newLabel = newLabel + 1
            for x in sasiedzi[i]:
                l[x] = newLabel
    uniqueLabels = list(sorted(set(l)))
    lista = [[] for x in uniqueLabels]
    for k in range(0,rozmiar):
        for i,d in enumerate(uniqueLabels):
            if l[k]==d:
                lista[i].append(k)
    ilosc = []
    for i, k in enumerate(uniqueLabels):
        ilosc.append([k, len(lista[i])])
    return l, uniqueLabels,lista,ilosc


#mplik_otworz()
#l, unique,lista,ilosc = segmentacja(ptCloud, 10)
