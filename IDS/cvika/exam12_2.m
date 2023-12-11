close all
clc
clear

load dataCV12/cv12dat2.mat

Tvz = time(2)-time(1);

fs=1/Tvz;
N = 6;
fc = 1;

s_hat = zeros(1,length(vystup));
s_hat(1) = vystup(1);
for i = 2:length(vystup)
    s_hat(i) = s_hat(i-1)+(1/i)*(vystup(i)-s_hat(i-1));
end

plot(time,vystup,time,s_hat)


k = [3,10,30];
s_hat = zeros(1,length(vystup));
s_hat(1) = vystup(1);
figure
plot(time,vystup)
hold on
for j = 1:3
    
    for i = 2:length(vystup)
        s_hat(i) = s_hat(i-1)+(1/k(j))*(vystup(i)-s_hat(i-1));
    end
    plot(time,s_hat)
end

legend("nefilter","k=3","k=10","k=30")
% plot(time,vystup,time,s_hat)

s_hat = zeros(1,length(vystup));
s_hat(1) = vystup(1);
N = [3,10,20];  
figure
plot(time,vystup)
hold on
for j = 1:3
    s_hat(1:N(j)) = vystup(1:N(j));
    for i = N(j)+1:length(vystup)
        s_hat(i) = s_hat(i-1)+(1/N(j))*(vystup(i)-s_hat(i-N(j)));
    end
    plot(time,s_hat)
end
legend("nefilter","N=3","N=10","N=20")