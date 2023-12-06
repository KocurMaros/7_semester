%%%%% 
% MOZE BYT NA SKUSKE musime aj graf vykreslit
clc
clear
close all
load dataCV11/cv11dat1.mat

s = tf('s');
m = 0; %rad citatela
n = 3; %rad menovatela
N = 7; %pocet merani

for j = 1:N
    x_1(j) = w(j)*(r(j)+i(j));
    x_2(j) = w(j)^2*(r(j)-i(j));
    x_3(j) = w(j)^3*(r(j)+i(j));
end
H = [ones(7,1),x_1',x_2'];
y = x_3';
theta_hat = inv(H'*H)*H'*y;

F = theta_hat(1)/(theta_hat(2)*s + theta_hat(3)*s^2 +s^3);

nyquist(F,w)
hold on 
plot(r,i,"ro");

clear
load dataCV11/cv11dat2.mat
s = tf('s');
m = 0; %rad citatela
n = 2; %rad menovatela
N = 10; %pocet merani
%TREBA davat pozor na transpoziciu re+im lebo po transponovani vznikne
%re-im
for j = 1:N 
    y(j,1) = R(j)+I(j)*i;
    H(j,:) = [-i*w(j)*(R(j)+i*I(j)), -(i*w(j))^2*(R(j)+i*I(j)), 1];
end

theta_hat = (inv(real(H'*H)))*(real(H'*y));

F = theta_hat(3)/(theta_hat(2)*s^2 + theta_hat(1)*s + 1);

figure
nyquist(F,w)
hold on 
plot(R,I,"ro");