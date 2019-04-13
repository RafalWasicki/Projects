close all
rodzaj = input('Czy pomieszczenia maj¹ byæ takie same? (1 - TAK)');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% WARTOSCI NOMINALNE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% POMIESZCZENIA
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
cpw=4175;
cpp=1000;
cps=880;
row=960;
rop=1.2;
ros=1800;
TzewN=-20;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% POMIESZCZENIE II
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if rodzaj == 1
    Twew2_N=20;
    Tgz2_N=90;
    Tgp2_N=70;
    Ts2_N=5;
    qg2_N=2*1000;
else
%     Twew2_N=input('Podaj wartosc nominalna Twew 2 pomieszczenia (20)');
%     Tgz2_N=input('Podaj wartosc nominalna Tgz 2 pomieszczenia (90)');
%     Tgp2_N=input('Podaj wartosc nominalna Tgp 2 pomieszczenia (70)');
%     Ts2_N=input('Podaj wartosc nominalna Ts 2 pomieszczenia (5)');
%     qg2_N=input('Podaj wartosc nominalna qg 2 pomieszczenia (2000)');
    Twew2_N=18;
    Tgz2_N=90;
    Tgp2_N=70;
    Ts2_N=4;
    qg2_N=2*1000;
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% POMIESZCZENIE I
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Twew1_N=20;
Tgz1_N=90;
Tgp1_N=70;
Ts1_N=5;
qg1_N=2*1000;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% WYMIENNIK
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
TwzN=130;
TwpN=110;
TozN=90;
TopN=70;
qwN=qg1_N+qg2_N;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% IDENTYFIKACJA
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% POMIESZCZENIE I
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Vw1=4*5*2.5;
Cvw1=cpp*rop*Vw1;
Vg1=1*0.20*0.5;
Cvg1=cpw*row*Vg1;
Vs1=5.5*4.5*3-Vw1;
Cvs1=cps*ros*Vs1;
Kcg1=qg1_N/(Tgp1_N-Twew1_N);
Kcw1=qg1_N/(Twew1_N-Ts1_N);
Kcs1=qg1_N/(Ts1_N-TzewN);
fmg1_N=qg1_N/(Tgz1_N-Tgp1_N)/cpw;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% POMIESZCZENIE II
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Vw2=Vw1;
Cvw2=cpp*rop*Vw2;
Vg2=1*0.20*0.5;
Cvg2=cpw*row*Vg2;
Vs2=Vs1;
Cvs2=cps*ros*Vs2;
Kcg2=qg2_N/(Tgp2_N-Twew2_N);
Kcw2=qg2_N/(Twew2_N-Ts2_N);
Kcs2=qg2_N/(Ts2_N-TzewN);
fmg2_N=qg2_N/(Tgz2_N-Tgp2_N)/cpw;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% WYMIENNIK
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Vv=2*1*0.20*0.5;
fmwN=qwN/(cpw*(TwzN-TwpN));
fm0N=qwN/(cpw*(TwzN-TwpN));
Kco=qwN/(TwpN-TozN);
Cv01=cpw*row*Vv;
Cv02=cpw*row*Vv;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% WARUNKI POCZATKOWE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Tzew0=TzewN;
% POMIESZCZENIE I
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% WEJSCIE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fmg1_0=fmg1_N;
Tgz1_0=Tgz1_N;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% WYJSCIE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
C_1=cpw*fmg1_0;
M_1=(Kcg1+Kcw1)*(Kcg1+C_1)*(Kcw1+Kcs1)-Kcg1^2*(Kcw1+Kcs1)-Kcw1^2*(Kcg1+C_1);
Twew1_0=(Kcg1*C_1*(Kcw1+Kcs1)*Tgz1_0+Kcw1*Kcs1*(Kcg1+C_1)*Tzew0)/M_1;
Ts1_0=(Kcw1*Twew1_0+Kcs1*Tzew0)/(Kcw1+Kcs1);
Tgp1_0=(C_1*Tgz1_0+Kcg1*Twew1_0)/(Kcg1+C_1);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% WARUNKI POCZATKOWE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% POMIESZCZENIE I
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% WEJSCIE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fmg2_0=fmg2_N;
Tgz2_0=Tgz2_N;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% WYJSCIE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
C_2=cpw*fmg2_0;
M_2=(Kcg2+Kcw2)*(Kcg2+C_2)*(Kcw2+Kcs2)-Kcg2^2*(Kcw2+Kcs2)-Kcw2^2*(Kcg2+C_2);
Twew2_0=(Kcg2*C_2*(Kcw2+Kcs2)*Tgz2_0+Kcw2*Kcs2*(Kcg2+C_2)*Tzew0)/M_2;
Ts2_0=(Kcw2*Twew2_0+Kcs2*Tzew0)/(Kcw2+Kcs2);
Tgp2_0=(C_2*Tgz2_0+Kcg2*Twew2_0)/(Kcg2+C_2);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% WARUNKI POCZATKOWE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% WYMIENNIK
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% WEJSCIE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fmw0=fmwN;
fm00=fm0N;
Twz0=TwzN;
Top0=TopN;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% WYJSCIE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
C1=cpw*fmw0;
C2=cpw*fm00;
M_1=(Kco+C2)*(C1+Kco)-Kco^2;
Toz0=(Kco*C1*Twz0+C2*(C1+Kco)*Top0)/M_1;
Twp0=(C1*Twz0+Kco*Toz0)/(C1+Kco);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% SYMULACJA
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% WARTOSCI ZADANE DO SYMULACJI
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
kp = 0.9 * T3 /(k3*T30);
Ti =3.33*T30;
ki= kp/Ti;

czas=1000000;
steptime=czas*10^(-2);
dTwz=0;
dTop=0;
dfmw=0;
dfmo=0;
dTzew=0;
dTgz1=0;
dfmg1=0;
dTgz2=0;
dfmg2=0;
dTwew1_0 = 2;
Tdelay1 = 11500;
Tdelay2 = Tdelay1;
maxstepsize = 5;

 figura = 1;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %OD Twz
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  % WYWOLANIE SIMULINKA
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[t]=sim('pomieszczenie',czas);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% PLOTOWANIE WARTOSCI WYJSCIOWYCH
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(1)
hold on
plot(t, Twew1, 'm')

kp = 0.65*kp;
ki= kp/Ti;
[t]=sim('pomieszczenie',czas);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(2)
hold on
plot(t, Twew1, 'm')

% figure(figura)
% title 'pomieszczenie 2 Twew'
% hold on;
% plot(t,Twew2,'b');
% figura= figura + 1;
% figure(figura)
% title 'pomieszczenie 2 Tgp'
% plot(t,Tgp2, 'k');
% figura= figura + 1;
% figure(figura)
% hold on;title 'pomieszczenie 2 Ts'
% plot(t,Ts2, 'm');
% figura= figura + 1;
% figure(figura)
% title 'pomieszczenie 1 Twew'
% hold on;
% plot(t,Twew1,'b');
% figura= figura + 1;
% figure(figura)
% hold on;title 'pomieszczenie 1 Tgp'
% plot(t,Tgp1, 'k');
% figura= figura + 1;
% figure(figura)
% hold on;title 'pomieszczenie 1 Ts'
% plot(t,Ts1, 'm');
% 
% figura= figura + 1;
% figure(figura)
% 
% title 'wymiennik Twp'
% hold on;
% plot(t,Twp, 'b');
% figura= figura + 1;
% figure(figura)
% title 'wymiennik Toz'
% plot(t,Toz, 'm');
% 
% figura= figura + 1;
% figure(figura)
% hold on; title 'wymiennik Top', ylabel 'TOP'
% plot(t,Top, 'm');

% figura = 1;
% figure(figura)
% hold on; title ' OD Twz ' 
% subplot(2,1,1)
% title 'pomieszczenia Twew'
% hold on;
% plot(t,Twew2,'b')
% hold on;
% plot(t,Twew1,'r');
% subplot(2,1,2)
% hold on; title 'wymiennik Top', ylabel 'TOP'
% plot(t,Top, 'm');

% 
% 
% 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %OD TZEW
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% dTwz=0;
% dTzew = abs(Tzew0*0.1);
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   % WYWOLANIE SIMULINKA
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% [t]=sim('pomieszczenie',czas);
% 
% figura = figura + 1;
% figure(figura)
% hold on; title ' OD Tzew ' 
% % subplot(2,1,1)
% title 'pomieszczenia Twew od Tzew'
% hold on;
% plot(t,Twew1,'r');
% hold on;
% plot(t,Twew2,'b')
% hold on;
% 
% legend('Twew1','Twew2');
% % subplot(2,1,2)
% % hold on; title 'wymiennik Top', ylabel 'TOP'
% % plot(t,Top, 'm');
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % OD fmw
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% dfmw=fmw0*0.1;
% dTzew = 0;
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   % WYWOLANIE SIMULINKA
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% [t]=sim('pomieszczenie',czas);
% 
% figura = figura + 1;
% figure(figura)
% hold on; title ' OD fmw ' 
% %subplot(2,1,1)
% title 'pomieszczenia Twew od fmw'
% hold on;
% plot(t,Twew1,'r');
% hold on;
% plot(t,Twew2,'b')
% hold on;
% legend('Twew1','Twew2');
% subplot(2,1,2)
% hold on; title 'wymiennik Top', ylabel 'TOP'
% plot(t,Top, 'm');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%ROWNANIA STANU
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

A=[
    -Kcg1-Kcw1,Kcw1,Kcg1,0,0,0,0,0;
    Kcw1,-Kcw1-Kcs1,0   ,0,0,0,0,0;
    Kcg1,0,-cpw*fmg1_0-Kcg1,0,0,0,cpw*fmg1_0,0;
    0,0,0,-Kcg2-Kcw2,Kcw2,Kcg2,0,0;
    0,0,0, Kcw2,-Kcw2-Kcs2,0  ,0,0;
    0,0,0,Kcg2,0,-cpw*fmg2_0-Kcg2,cpw*fmg2_0,0;
    0,0,fmg1_0*cpw,0,0,fmg2_0*cpw,-cpw*(fmg1_0+fmg2_0)-Kco,Kco;
    0,0,0,0,0,0,Kco,-cpw*fmw0-Kco];
B=[
    0,0;
    Kcs1,0;
    0,0;
    0,0;
    Kcs2,0;
    0,0;
    0,0;
    0,cpw*fmw0];
