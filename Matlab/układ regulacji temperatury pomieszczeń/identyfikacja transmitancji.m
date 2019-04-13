close all
% identyfikowane transmitancje
s = tf('s');
t1 = 0:1:czas;
% Twew1 i Twew2 od Tzew
T1 = 462940;
k1=0.7314;
k2=0.7473;
T2 = 438750;
mod2 = k2/(T2*s+1);
mod1 = k1/(T1*s+1);

k4 = 96.9017;
T4 = 229800;
T40 = 23000;

mod4= k4/(T4*s+1)*exp(-s*T40);

k3 = 101.9744;
T3 = 225640;
T30 = 11500;
mod3 = k3/(T3*s+1)*exp(-s*T30);
L = [k3];
M = [T3 ,1];


kp = 0.9 * T3 /(k3*T30);
Ti =3.33*T30;
ki= kp/Ti;
dTwew1_0 = 2;
t = sim('regulacja',1000000);
%sim('pomieszczenie',100000);