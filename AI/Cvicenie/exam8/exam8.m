clc
clear 
close all

sim_time = 2500;
sim_step = 0.1;

u = 33.6;

% [x,t] = simplenarx_dataset;
out = sim("exam8_sim.slx");

x_train = num2cell((out.w.Data)');
y_train = num2cell((out.y.Data)');

x_test = num2cell((out.w1.Data)');
y_test = num2cell((out.y1.Data)');
% t = num2cell((out.w.Time)');
% trainPercentage = 0.8; 
% numTimeSteps = numel(x1);
% numTrain = floor(trainPercentage * numTimeSteps);
% Xtrain = x_train(:,1:numTrain);
% Xtest = x_train(:,numTrain+1:end);
% Ytrain = y_train(:,1:numTrain);
% Ytest = y_train(:,numTrain+1:end);

net = narxnet(1:2,1:2,10);
net.divideFcn = 'dividetrain';
net.divideParam.testRatio = 0.0;
net.divideParam.trainRatio = 0.7;
net.divideParam.valRatio = 0.3;
net.trainParam.epochs = 500;

[X,Xi,Ai,T] = preparets(net,x_train,{},y_train);
net = train(net,X,T,Xi,Ai);
Y_net_train = net(x_test,Xi,Ai);
% Y_net_test = net(x_test,Xi,Ai);

netc = closeloop(net);

[Xc,Xic,Aic,Tc] = preparets(netc,x_train,{},y_train);
Y_netc_test = netc(Xc,Xic,Aic);
% Y_netc_test = net(x_test,Xic,Aic);

gensim(net)
gensim(netc)


% [X,Xi,Ai,T] = preparets(net,x1,{},y1);
% X_out = Xtest(1,:);
% X_arr = cell2mat(X_out);
% Y_arr = cell2mat(Y_out);
% plot(X_arr,Y_arr, 'b'); hold on; plot(x1,y1, 'r');

% 
% view(net)
% Y = net(X,Xi,Ai)
% perf = perform(net,Y,T)
% 
% netc = closeloop(net);
% view(netc)
% [Xc,Xic,Aic,Tc] = preparets(netc,x1,{},t);
% Yc = netc(Xc,Xic,Aic);
% 
% gensim(net)