clc
clear
close all

sim_time = 100;
sim_step = 1/200;

u = 33.6;

[x,t] = simplenarx_dataset;
out = sim("exam8_sim.slx");
y1 = out.y.Data;
y2 = out.y1.Data;
x1 = out.w.Data;
x2 = out.w1.Data;
t(:,1) = 0:sim_step:sim_time;

net = narxnet(1:2,1:2,10);
[X,Xi,Ai,T] = preparets(net,x1,{},t);
% net = train(net,X,T,Xi,Ai);
% view(net)
% Y = net(X,Xi,Ai)
% perf = perform(net,Y,T)
% 
% netc = closeloop(net);
% view(netc)
% [Xc,Xic,Aic,Tc] = preparets(netc,x,{},t);
% Yc = netc(Xc,Xic,Aic);

gensim(net)