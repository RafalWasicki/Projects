function [W1,W2] = initbi(S, K1, K2)

a = -0.4;
b= 0.4;
% warstwa z funkcja bipolarna
w10 = 0*ones(1,K1); 
W1 = vertcat(w10, (b-a)*rand(S,K1)+a);
% warstwa z funkcja liniowa
w20 = 0.5*ones(1,K2); 
W2 = vertcat(w20, (b-a)*rand(K1,K2)+a);
end
