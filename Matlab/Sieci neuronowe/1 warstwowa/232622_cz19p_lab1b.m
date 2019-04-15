
baza_ucz_we =[
  4 2 0 ;  %liczba nóg
  -1 1  1;  % czy jajorodne
  -1 2 -1; %czy potrafi latac
  0 -1 2]; % czy potrafi plywaæ

baza_sprawdz =[
    2 4;
    -1 1;
    2 -1;
    -1 1];
    


baza_ucz_wy =[
  1 0 0 ; % ssak
  0 1 0 ; % ptak
  0 0 1 ]; % ryba

n = size(baza_ucz_we, 1); %liczba wejœæ
k = size(baza_ucz_wy, 1); %liczba neuronów

eta = 0.15;               %wspó³czynnik uczenia siê sieci
beta = 1.25;              %wspó³czynnik funkcji aktywacji
epoki = 5000;             %epoki

a = -0.1;                  %zakres gorny przedzia³u
b = 0.1;                  %zakres dolny przedzia³u
W = (b-a)*rand(n,k)+a;

for ep=1 : epoki
L =randperm(3,1);  %algrytm losuj¹cy
x = baza_ucz_we(:,L);
u = W'*x;
y = (1-exp(-beta*u))./(1+exp(-beta*u));  %sigmoidalna funkcja aktywacji
ty = baza_ucz_wy(:, L);
d = ty - y;

dW = eta*x*d';
W = W + dW;
end

for i=1 : size(baza_ucz_we, 2)
    x = baza_ucz_we(:,i);
    u = W'*x;
    y = (1-exp(-beta*u))./(1+exp(-beta*u));
    [baza_ucz_wy(:,i) y]
end

for i=1 : size(baza_sprawdz, 2)
    x = baza_sprawdz(:,i);
    u = W'*x;
    y = (1-exp(-beta*u))./(1+exp(-beta*u));
    [baza_ucz_wy(:,i) y]
end