function [Y1, Y2] = liczbi(W1, W2, X, alfa,a)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
X1 = [-1 ;X];
U1 = W1'*X1;
% funkcja bipolara
Y1 = (1-exp(-alfa*U1))./(1+exp(-alfa*U1));
%funkcja unipolarna
%Y1 = 1./(1+exp(-alfa*U1));
X2 = [-1; Y1];
U2 = W2'*X2;
%funkcja liniowa
Y2 = a.*U2;
% funkcja bipolara
%Y2 = (1-exp(-alfa*U2))./(1+exp(-alfa*U2));
% funkcja unipolara
%Y2 = 1./(1+exp(-alfa*U2));

end
