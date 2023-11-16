g = 9.81;
r = 0.4; %m
b = 1*10^-2; %Nms-1
m = 0.03; %kg

A1 = [[0 1];[ -g/r -b/(m*r^2)]];
lambda1 = eig(A1)
% lambda = roots([1 b/(m*r^2) g/r])

A2 = [[0 1];[ g/r -b/(m*r^2)]];
lambda2 = eig(A2)   

A3 = [[0 1];[g/r -b/(m*r^2)]];
lamda3 = eig(A3)

lambda4 = roots([1 b/(m*r^2) g/r])