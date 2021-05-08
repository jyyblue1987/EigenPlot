%% Generate Eignevalue's graph
clc 
clear all

% define paramters
N = 60;

lambda = 0;

t = 2;
E0 = 0;
f = 1/3;
a = 1;
n = 1:N;

scale = 1
x = [-pi/scale:0.01:pi/scale];
step = length(x);
res=zeros(N,step);
c = 1;

for k = -pi/scale:0.01:pi/scale
    r = E0 - 2*t*cos(2*pi*f*n + k*a*scale);
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

figure 
for i =1:N
    hold on;
    plot(x, res(i,:))
end




