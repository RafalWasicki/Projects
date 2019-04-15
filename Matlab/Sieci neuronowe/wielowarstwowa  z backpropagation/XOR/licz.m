function [Y1, Y2] = licz(W1, W2, X)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
beta = 1.25;
X1 = [-1 ;X];
U1 = W1'*X1;
Y1 = 1./(1+exp(-beta*U1));
X2 = [-1; Y1];
U2 = W2'*X2;
Y2 = 1./(1+exp(-beta*U2));

end
