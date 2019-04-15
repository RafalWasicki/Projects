function [W1po, W2po] = uczbi(W1przed, W2przed, A, B, n,alfa, eta,a)

% W1przed - macierz wag warstwy 1. przed uczeniem.
% W2przed - macierz wag warstwy 2. przed uczeniem.
% P - macierz przyk³adów ucz¹cych
% T - macierz wyjœæ ucz¹cych
% n - liczba epok


liczbaPrzykladow = size(A,2);
W1 = W1przed ;
W2 = W2przed ;

for i = 1 : n
    L = randperm(liczbaPrzykladow,1);
    X = A(:, L);
    [ Y1 , Y2 ] = liczbi(W1, W2, X,alfa,a);
    X1 = [-1; X];
    X2 = [-1; Y1];
     % bipolarna + liniowa
     D2 = a.* (B(:, L) - Y2) ;
     D1 = alfa.*  W2(2:end,:)*D2 .*(1 - (Y1.*Y1)) ;
     % bipolarna + bipolarna
%    D2 = alfa.* (B(:, L) - Y2)  .*(1 - (Y2.*Y2)) ;
%    D1 = alfa.*  W2(2:end,:)*D2 .*(1 - (Y1.*Y1)) ;
     % unipolarna + unipolarna
%    D2 = alfa.* (B(:, L) - Y2)  .*Y2.*(1 - Y2) ;
%    D1 = alfa.*  W2(2:end,:)*D2 .*Y1.*(1 - Y1) ;
    dW1 = eta*X1*D1';
    dW2 = eta*X2*D2';
    W1 = W1 + dW1;
    W2 = W2 + dW2;
end
W1po = W1 ;
W2po = W2 ;
end

