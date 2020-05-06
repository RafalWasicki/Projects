## Szachy HMI
Jest to projekt szachów oparty na PLC **Siemens S7-1200/1500** oraz **panelu HMI** serii Comfort. 

Projekt został wykonany w celu rozwinięcia moich umiejętności tworzenia złożonych programów na sterowniki PLC. 
Program napisałem w większości w języku **STL (ST) oraz LD**, z wykorzystaniem oprogramowania TIA Portal V14. 

Budowa programu:
* obsługa partii szachów odbywa się na PLC,
* HMI odpowiada za stronę wizualną oraz interakcję z użytkownikiem,
* W każdej turze odbywa się wykrywanie możliwych ruchów oraz odpowiednie blokowanie niemożliwych do wciśnięcia pól.
* podział kodu na wiele funkcji wykorzystywanych wielokrotnie,

 W ostatnim czasie projekt został rozwinięty o możliwość obsługi partii z dwóch paneli HMI (przygotowania do prezentacji na Dniach Aktywności Studenckiej na Pwr).
 

Dalszy rozwój projektu zakłada wykorzystanie **algorytmu generacji ruchów** w celu stworzenia gry przeciwko AI.

Pierwsze próby implementacji algorytmu generowania ruchu zostały już przeze mnie podjęte.
Ze względu na ograniczenia sprzętowe, głownie brak możliwości dynamicznej alokacji pamięci, zdecydowałem się na wykorzytanie prostego algorytmu MinMax z rozszerzeniem AlfaBeta. [Link do wiki o algorytmie](https://en.wikipedia.org/wiki/Alpha%E2%80%93beta_pruning).

<details>
  <summary>Zdjęcie aplikacji </summary>
  
![Ekran HMI](/Szachy/szachy.png)
  
</details>
<details>
  <summary>Uruchomienie </summary>
  
W celu uruchomienia aplikacji należy otworzyć projekt w oprogramowaniu TIA Portal V14. Aplikacja działa poprawnie przy wykorzystaniu symulatora HMI oraz PLC jak i na rzeczywistych urządzeniach.
  
</details>
