## Repozytorium projektów
Nazywam się Rafał Wasicki. To repozytorium zawiera moje projekty wykonane w ramach pracy na uczelni oraz działalności w kołach naukowych. 
Projekty podzieliłem uwględniając język w którym zostały napisane oraz ich zlożoność.
## LIDAR 3D
Jest to projekt 5-osobowy wykonany na VI semestrze we współpracy z PPG Deco Polska sp. z o.o. w ramach konferencji projektów zespołowych organizowanej na wydziale Elektroniki Politechniki Wrocławskiej. Projekt ten zakładał zaprojektowanie i wykonanie robota służącego do mapowania powierzchni hal przemysłowych. 

[Tutaj](https://www.ppgpeople.com/community/our-facility-in-poland-supports-student-innovators?fbclid=IwAR2wWcaHOsauNnq-leqSy5yHrmsL0AX6KWDFkoyE4jbAhU6uEK2qMxrP0ig) znajduje się artykuł firmy o projekcie.
#### Główne założenia projektu
* Manipulator z dwoma stopniami swobody
* Technologia LIDAR
* Aplikacja do wyświetlania i przetwarzania chmur pomiarowych. 

Moim zadaniem w omawianym projekcie było wykonanie aplikacji do prezentacji i przetwarzania danych (usuwania błędów grubych, dokonywania interpolacji pomiarów).

Aplikacja została zrealizowania w języku Python i jest umieszczona na tym repozytorium. 
<details>
  <summary>Zdjęcia aplikacji </summary>
  
![Interfejs aplikacji](/LIDAR3D/interfejs.png)

![Wyswietlona chmura punktów w aplikacji](/LIDAR3D/chmura.png)
  
</details>

## Szachy HMI
Jest to projekt szachów oparty na PLC S7-1200/1500 oraz panelu HMI serii Comfort. 

Projekt został wykonany w celu rozwinięcia moich umiejętności tworzenia złożonych programów na sterowniki PLC. 
Program napisałem w większości w języku STL (ST) oraz LD, z wykorzystaniem oprogramowania TIA Portal V14. 

Budowa programu:
* obsługa partii szachów odbywa się na PLC,
* HMI odpowiada za stronę wizualną oraz interakcję z użytkownikiem,
* W każdej turze odbywa się wykrywanie możliwych ruchów oraz odpowiednie blokowanie niemożliwych do wciśnięcia pól.
* podział kodu na wiele funkcji wykorzystywanych wielokrotnie,

 W ostatnim czasie projekt został rozwinięty o możliwość obsługi partii z dwóch paneli HMI (przygotowania do prezentacji na Dniach Aktywności Studenckiej na Pwr).
 
Dalszy rozwój projektu zakłada wykorzystanie algorytmu generacji ruchów w celu stworzenia gry przeciwko AI.
Pierwsze próby implementacji algorytmu generowania ruchu zostały już przeze mnie podjęte.
Ze względu na ograniczenia sprzętowe, głownie brak możliwości dynamicznej alokacji pamięci, zdecydowałem się na wykorzytanie prostego algorytmu MinMax z rozszerzeniem AlfaBeta. [Link do wiki o algorytmie](https://en.wikipedia.org/wiki/Alpha%E2%80%93beta_pruning).

<details>
  <summary>Zdjęcie aplikacji </summary>
  
![Ekran HMI](/Szachy/szachy.png)
  
</details>

## Pozostałe projekty
Projekty w folderach Python oraz Matlab to mniej złożone projekty wykonane w ramach zajęć na uczelni. Obejmują one głównie:
* algorytmy uczenia sieci neuronowych,
* algorytmy szeregowania zadań produkcyjnych,
* projekt symulacji systemu ogrzewania w budynku (Matlab).
