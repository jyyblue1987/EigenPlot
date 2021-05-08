%% Generate Eignevector's graph
clc 
clear all

% define paramters
N = 60;

lambda = 0;

t = 0.5;
E0 = 2;
f = 1/3;
a = 10;
n = 1:N;

c = 1;

k = 0.5;
r = E0 - 2*t*cos(2*pi*f*n + k*a);
M = diag(r);
for i = 2:N
    M(i, i - 1) = 1;
    M(i - 1, i) = 1;
end 
M(N, 1) = lambda;
M(1, N) = lambda;

[V, D] = eig(M);

d = [19 20 21 22]

figure 

colors = ['r', 'y', 'b', 'g']
for i =1:length(d)
    hold on;
    plot(V(:,d(i)), colors(i));
end




