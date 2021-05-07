%% Generate Eignevalue's graph
clc 
clear all

% define paramters
N = 60

lambda = 0

t = 0.5
E0 = 2
f = 1/3
a = 10
n = 1:N;

x = [-pi:0.01:pi];
step = length(x);
res=zeros(N,step);
c = 1;

for k = -pi:0.01:pi
    r = E0 - 2*cos(2*pi*f*n + k*a);
    M = diag(r);
    for i = 2:N
        M(i, i - 1) = 1;
        M(i - 1, i) = 1;
    end 
    M(N, 1) = lambda;
    M(1, N) = lambda;
    
    [V, D] = eig(M);
    d = diag(D);
    res(:, c) = d;
    
    c = c + 1;
end

disp('end of calculating eigenvalue data') 

figure 
for i =1:N
    hold on;
    plot(x, res(i,:))
end



