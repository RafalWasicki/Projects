Laboratorium 2 Algorytm NEH:
1. Porównanie działania algorytmu brute force, Johnson, NEH:
    W folderze statystyki znajdują się informacje, które wskazują na to, że brute force działa dużo wolniej niż reszta algorytmu ale jesteś pewni, że zwróci optymalne rozwiązanie problemu. Algorytm Johnsona w porównaniu do algorytmu NEH działa szybciej, dla 29 zadań jest to róznica 10^2, ale ze względu na czas wykonywania i milisekundach nie jesteśmy w stanie odczuć tej róznicy (zostało to sprawdzone za pomocą funkcji time.clock(), która liczy czas działania procesora. Początek zlicza został umieszczony przed rozpoczęciem samego algorytmu natomiast zakończenie tuż po a przed wpisanie wartości do tabel porównawczych), jednak w większości przypadku algorytm NEH działa lepiej, gdyż zwraca wartości Cmax mniejsze lub równe wartościom zwróconym przez algorytm Johnsona. 