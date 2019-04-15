
baza_ucz_we =[
  4 2 2 4 ;  %liczba kó³
  1 1 0 0 ;  % pojazd silnikowy
  0 0 1 0 ;  % pojazd napedzany przez cz³owieka
  1 0 0 0 ]; % poduszki powietrzne



baza_ucz_wy =[
  1 0 0 0 ; % samochod
  0 1 0 0 ; % motocykl
  0 0 1 0 ; % rower
  0 0 0 1 ];% wóz

n = size(baza_ucz_we, 1); %liczba wejœæ
k = size(baza_ucz_wy, 1); %liczba neuronów

eta = 0.15;               %wspó³czynnik uczenia siê sieci
beta = 1.25;              %wspó³czynnik funkcji aktywacji
epoki = 5000;             %epoki

a = -0.1;                  %zakres gorny przedzia³u
b = 0.1;                  %zakres dolny przedzia³u
W = (b-a)*rand(n,k)+a;

for ep=1 : epoki
L =randperm(4,1);  %algrytm losuj¹cy
x = baza_ucz_we(:,L);
u = W'*x;
y = 1./(1+exp(-beta*u));
ty = baza_ucz_wy(:, L);
d = ty - y;

dW = eta*x*d';
W = W + dW;
end

for i=1 : size(baza_ucz_we, 2)
    x = baza_ucz_we(:,i);
    u = W'*x;
    y = 1./(1+exp(-beta*u));
    [baza_ucz_wy(:,i) y]
end
