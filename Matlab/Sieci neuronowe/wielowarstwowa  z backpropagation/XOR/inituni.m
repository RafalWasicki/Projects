function [W1,W2] = inituni(S, K1, K2)

a = -0.3;
b= 0.3;
w10 = 0.5*ones(1,K1); 
W1 = vertcat(w10, (b-a)*rand(S,K1)+a);
w20 = 0.5*ones(1,K2); 
W2 = vertcat(w20, (b-a)*rand(K1,K2)+a);
end

