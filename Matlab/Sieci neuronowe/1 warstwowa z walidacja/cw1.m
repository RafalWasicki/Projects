clear all
load baza_cyfry100.mat
clc

baza_we = baza_we_100;
baza_wy = baza_wy_100;


%horzcat  ()
n = size(baza_we, 1); %liczba wejœ)æ
k = size(baza_wy, 1); %liczba neuronów
j = size(baza_we, 2); % ilosc probek w pliku
w0 = 0.5*ones(1,k);       %przygotowanie wektora biasu
eta = 0.015;               %wspó³czynnik uczenia siê sieci
beta = 1.15;              %wspó³czynnik funkcji aktywacji
epoki = 50000;             %epoki

[uczind,walind,testind] = dividerand(j);
baza_ucz_we = baza_we(:,uczind);
baza_ucz_wy = baza_wy(:,uczind);
baza_wal_we = baza_we(:,walind);
baza_wal_wy = baza_wy(:,walind);
baza_test_we = baza_we(:,testind);
baza_test_wy = baza_wy(:,testind);

walidacja = 0;
a =-0.3;                  %zakres gorny przedzia³u
b = 0.3;                  %zakres dolny przedzia³u
W = (b-a)*rand(n,k)+a;
bladucz =[];
bladwal=[];
bladtest=[];
blad = 1;
bladp = 1;
W0 = vertcat(w0,W);
for ep=1 : epoki
    j = 0;
    if mod(ep,40) == 0
        im=[];
        bladp = blad;
        j = 1;
        for i = 1 : size(baza_wal_we,2)
            
            %algrytm losuj¹cy\
            
            x = baza_wal_we(:,i);
            x0 = vertcat(-1,x);
            u = W0'*x0;
            y = 1./(1+exp(-beta*u));
            ty = baza_wal_wy(:, i);
            im =[im,immse(ty,y)];
        end
        blad = sum(im)/size(baza_wal_we,2);
        bladwal = horzcat(bladwal,blad);
        
    end
    if j==1
        if blad>bladp+0.02
            break
        elseif blad <0.02
            break
        end
    end
    L =randperm(size(baza_ucz_we,2),1);  %algrytm losuj¹cy
    x = baza_ucz_we(:,L);
    x0 = vertcat(-1,x);
    
    u = W0'*x0;
    y = 1./(1+exp(-beta*u));
    ty = baza_ucz_wy(:, L);
    d = ty - y;
    bladucz = horzcat(bladucz,immse(ty,y));
    dW = eta*x0*d';
    W0 = W0 + dW;
end

for i=1 : size(baza_test_we, 2)
    x = baza_test_we(:,i);
    x0 = vertcat(-1,x);
    u = W0'*x0;
    y = 1./(1+exp(-beta*u));
    ty = baza_test_wy(:,i);
    bladtest = horzcat(bladtest,immse(ty,y));
end
figure(1)

subplot(3,1,1);
hold on;
title("blad œredniokwadratowy zestawu walidacyjnego");
xlabel('epoki');
ylabel('MSE');
plot(1:size(bladwal,2),bladwal);
ylim([0, 0.5]);
subplot(3,1,2);
hold on;
xlabel('epoki');
ylabel('MSE');
title("blad œredniokwadratowy zestawu ucz¹cego");
plot(1:size(bladucz,2),bladucz);
ylim([0, 0.5]);
subplot(3,1,3);
hold on;
xlabel('epoki');
ylabel('MSE');
title("blad œredniokwadratowy zestawu testowego");
scatter(1:size(bladtest,2),bladtest);
ylim([0, 0.5]);
sum(bladtest)/size(baza_test_we, 2)