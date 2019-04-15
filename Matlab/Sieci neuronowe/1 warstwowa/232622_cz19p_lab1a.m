
baza_ucz_we =[
  4 2 2 4 ;  %liczba k�
  1 1 0 0 ;  % pojazd silnikowy
  0 0 1 0 ;  % pojazd napedzany przez cz�owieka
  1 0 0 0 ]; % poduszki powietrzne



baza_ucz_wy =[
  1 0 0 0 ; % samochod
  0 1 0 0 ; % motocykl
  0 0 1 0 ; % rower
  0 0 0 1 ];% w�z

n = size(baza_ucz_we, 1); %liczba wej��
k = size(baza_ucz_wy, 1); %liczba neuron�w

eta = 0.15;               %wsp�czynnik uczenia si� sieci
beta = 1.25;              %wsp�czynnik funkcji aktywacji
epoki = 5000;             %epoki

a = -0.1;                  %zakres gorny przedzia�u
b = 0.1;                  %zakres dolny przedzia�u
W = (b-a)*rand(n,k)+a;

for ep=1 : epoki
L =randperm(4,1);  %algrytm losuj�cy
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
