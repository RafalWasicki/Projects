
                % zadanie XOR


A = [ 0 0 1 1 ; % wejœcia sieci
      0 1 0 1 ];
  
B = [ 0 1 1 0 ]; % ¿¹dane wyjœcie sieci
[ W1 , W2 ] = inituni ( 2 , 2 , 1 );
[ W1 , W2 ] = ucz ( W1 , W2 , A , B , 2000 );


test = [];
for i=1 : size(A, 2)
    X = A(:,i);
   [Y1, Y2] = licz(W1,W2,X);
   test =[test, Y2];
end
test