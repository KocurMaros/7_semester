clear 
clc
close all
load('cv4data.mat')
figure(1) 
hold on;
% plot(t,y);
plot(t,yv);

y_tt = yv;
u = ones(30,1);

for i = 1:length(y_tt)-1
    y_i1(i) = y_tt(i);  
end
y_i = y_i1';

H = [-y_i u];
theta = inv(H'*H)*H'*y(2:end);
prenos = tf([theta(2)],[1 theta(1)],tvz);
y_s = step(prenos,t);

y2 = H * theta;
e = y(2:end)-y2;
q = e'*e;
s = sum(e)
plot(t,y_s);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
u1 = ones(29,1);

for i = 1:length(y_tt)-2
    y_i1s(i) = y_tt(i);  
end
pos = 1;
for i = 2:length(y_tt)-1
    y_i2(pos) = y_tt(i);
    pos = pos + 1;
end
y_i11 = y_i1s';
y_i22 = y_i2';

H1 = [-y_i11 -y_i22 u1];
theta1 = inv(H1'*H1)*H1'*y(3:end);
prenos1 = tf([theta1(3) 0],[1 theta1(2) theta1(1)],tvz);
y_s1 = step(prenos1,t);

y3 = H1 * theta1;
e1 = y(3:end)-y3;
q1 = e1'*e1;
s1 = sum(e1)
plot(t,y_s1);
% legend("y","y_{prvy}","y_{druhy}");
legend("y_{sum}","y_{prvy}","y_{druhy}");
% legend("y","y_{sum}","y_{prvy}","y_{druhy}");