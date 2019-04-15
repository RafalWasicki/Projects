close all;
clear all;
% dane ucz¹ce
x=0:10;
y=sin(x/4)+cos(x);  
max = max(abs(y));
x = (x)/10;
y = y/max;
figure(1);
scatter(x, y,'x');
hold on;

% dane testuj¹ce
xt=0:0.1:10;
yt=sin(xt/4)+cos(xt); 
xt = (xt)/10;
yt = yt/max;
scatter(xt, yt);
hold on;
%%%%%%%%%%%%%%%%%%%%%%
alfa = 8;
eta = 0.10;
a = 0.4;
[ W1 , W2 ] = initbi ( 1,15 , 1 );
[ W1 , W2 ] = uczbi ( W1 , W2 , xt , yt , 100000, alfa, eta,a );


test = [];
for i=1 : size(xt,2)
    X = xt(:, i);
   [Y1, Y2] = liczbi(W1,W2,X, alfa,a);
   test =[test, Y2];
end
plot(xt,test);