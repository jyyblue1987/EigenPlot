%% Generate Eignevalue's graph
clc 
clear all

% define paramters
N = 4

lambda = 1

t = 0.5
E0 = 2
f = 1/3
a = 10
n = 1:N

step = int32(2*pi/0.01)
res=zeros(N,step);
k = 1;

for k = -pi:0.01:pi
    r = E0 - 2*t*cos(2*pi*f*n + k*a);
    M = diag(r);
    for i = 2:N
        M(i, i - 1) = 1;
        M(i - 1, i) = 1;
    end 
    M(N, 1) = lambda;
    M(1, N) = lambda;
    if k > step
        break
    end
    
    [V, D] = eig(M);
    d = diag(D);
    res(:, k) = d
    
    k = k + 1;
end
