clc
clear 
close all
tf2.Numerator = [2.423 0.0069519];
tf2.Denominator = [1 4.7439 28.489 0.026838];

sim_time = 250;
sim_step = 0.01;

u = 33.6;

% [x,t] = simplenarx_dataset;
out = sim("exam8_sim23a.slx");

x_train = num2cell((out.w.Data)');
y_train = num2cell((out.y.Data)');

% x_test = num2cell((out.w1.Data)');
% y_test = num2cell((out.y1.Data)');

% trainPercentage = 0.8; 
% numTimeSteps = numel(x_train);
% numTrain = floor(trainPercentage * numTimeSteps);
% Xtrain = x_train(:,1:numTrain);
% Xtest = x_train(:,numTrain+1:end);
% Ytrain = y_train(:,1:numTrain);

Xtrain = x_train;
Ytrain = y_train;
net = narxnet(1:2,1:2,10);
net.divideFcn = 'dividetrain';

[X,Xi,Ai,T] = preparets(net,Xtrain,{},Ytrain);
net = train(net,X,T,Xi,Ai);
[Y, Xf, Af] = net(X,Xi,Ai);

perf = perform(net,T,Y);


y_plot = cell2mat(Y);
figure(1)
hold on
plot(out.y.Data,'b')
plot(y_plot,'r');
xlabel("vzorky [pocet]")
ylabel("y oyput")
title("Trenovacie data");
%%%%%%%%%%close loop
x_train = num2cell((out.w1.Data)');
y_train = num2cell((out.y1.Data)');



Xtest = x_train;
Ytest = y_train;

[Xc,Xic,Aic,Tc] = preparets(net,Xtest,{},Ytest);
Yc = net(Xc,Xic,Aic);
y_plotcc = cell2mat(Yc);

figure(3)
hold on
vstupne =out.y1.Data;
plot(vstupne,'b');
plot(y_plotcc,'g');
xlabel("vzorky [pocet]")
ylabel("y oyput")
title("Testovanie open loop siete na inom datasete");

netc = closeloop(net);

trainPercentage = 0.8; 
numTimeSteps = numel(x_train);
numTrain = floor(trainPercentage * numTimeSteps);
Xtrain = x_train(:,1:numTrain);
Xtest = x_train(:,numTrain+1:end);
Ytrain = y_train(:,1:numTrain);

[Xc,Xic,Aic,Tc] = preparets(netc,Xtrain,{},Ytrain);
Yc = netc(Xtest,Xic,Aic);
y_plotcc = cell2mat(Yc);

figure(2)
hold on
vstupne =out.y1.Data;
offsetnute = vstupne(20000:end);
plot(offsetnute,'b');
plot(y_plotcc,'g');
xlabel("vzorky [pocet]")
ylabel("y oyput")
title("Testovanie close loop siete na inom datasete");

% gensim(net,sim_step)
% gensim(netc,sim_step)

netc = closeloop(net);

[Xc,Xic,Aic,Tc] = preparets(netc,Xtrain,{},Ytrain);
Yc = netc(Xtest,Xic,Aic);
y_plotcc = cell2mat(Yc);

figure(2)
hold on
vstupne =out.y1.Data;
offsetnute = vstupne(20000:end);
plot(offsetnute,'b');
plot(y_plotcc,'g');
xlabel("vzorky [pocet]")
ylabel("y oyput")
title("Testovanie close loop siete na inom datasete");

% gensim(net,sim_step)
% gensim(netc,sim_step)
