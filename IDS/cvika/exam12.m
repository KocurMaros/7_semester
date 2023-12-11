close all
clc
clear

load dataCV12/cv12dat1.mat

Tvz=0.001;
t = 0:Tvz:10;
fs=1/Tvz; %frekvencia vzorkovania [Hz]
x = square(2*pi*0.1*t)+0.4*sin(2*pi*t)+0.1*sin(2*pi*10*t);
% obdlznik frekvencia 0.1 Hz = 0.628 rad/s
% sinus 0.4 frekvencia 1 Hz = 6.28 rad/s
% sinus 0.1 frekvencia 10 Hz = 62.8 rad/s
N=2; %rad filtra
fc=5; %frekvencia zlomu filtra - cutoff frequency [Hz]
%Cutoff frequency is that frequency where the
%magnitude response of the filter is sqrt(1/2)=3.01dB.
Wn=2*fc/fs; %The cutoff frequency Wn must be 0.0 < Wn < 1.0,
%with 1.0 corresponding to half the sample rate
[B1,A1] = butter(N,Wn) %dolnopriepustny filter
[B2,A2] = butter(N,Wn,'high') %hornopriepustny filter
y1 = filter(B1,A1,x); %filtrovany vystup - dolnopriepustny filter
y2 = filter(B2,A2,x); %filtrovany vystup - hornopriepustny filter
plot(t,x,t,y1,t,y2)
DP=tf(B1,A1,Tvz)
HP=tf(B2,A2,Tvz)
% fvtool(B1,A1)
% fvtool(B2,A2)

R=1; % R decibels of peak-to-peak ripple in the passband
% Use R=0.5 as a starting point, if you are unsure about
% choosing R
[B1,A1] = cheby1(N,R,Wn); % dolnopriepustny Chebychevov filter typ1
[B2,A2] = cheby1(N,R,Wn,'high'); % hornopriepustny Chebychevov filter typ1

y1 = filter(B1,A1,x); %filtrovany vystup - dolnopriepustny filter
y2 = filter(B2,A2,x); %filtrovany vystup - hornopriepustny filter
% fvtool(B1,A1)
% fvtool(B2,A2)
figure
plot(t,x,t,y1,t,y2)

Rp=5; % R decibels of peak-to-peak ripple in the passband
% Use R=0.5 as a starting point, if you are unsure about
% choosing R
[B1,A1] = cheby2(N,Rp,Wn); % dolnopriepustny Chebychevov filter typ1
[B2,A2] = cheby2(N,Rp,Wn,'high'); % hornopriepustny Chebychevov filter typ1

y1 = filter(B1,A1,x); %filtrovany vystup - dolnopriepustny filter
y2 = filter(B2,A2,x); %filtrovany vystup - hornopriepustny filter
fvtool(B1,A1)
fvtool(B2,A2)
figure
plot(t,x,t,y1,t,y2)