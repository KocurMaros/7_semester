clear
clc
close all

ui = [2 3 4 4 5 6 6 6 7 8 9 10 12 13 14]';
yi = [8 10 7 6 5 5 4 3 4 5 3 2 1 1 2]';

lenght = size(yi);
for i = 1:lenght(1,1)
    H1(i,:) = [1 ui(i)];
end

%%%%%%%%%%%%%%%%%%%%%%
%linearna regresia
theta_1 = inv(H1'*H1)*H1'*yi;
y1 = H1*theta_1;
e1 = yi-y1;
q1 = e1'*e1;
s1 = sum(e1);
plot(ui,yi,"ro") 
hold on;
plot(ui,y1)

%%%%%%%%%%%%%%%%%%%%%
%kvadraticka funkcia
l = ones(1,lenght(1,1))';
H2 = [l,ui,ui.^2];
theta_2 = inv(H2'*H2)*H2'*yi;
y2 = H2 * theta_2;
e2 = yi-y2;
q2 = e2'*e2;
s2 = sum(e2);
plot(ui,y2)

%%%%%%%%%%%%%%%%%%%%%
%kubicka funkcia
l = ones(1,lenght(1,1))';
H3 = [l,ui,ui.^2, ui.^3];
theta_3 = inv(H3'*H3)*H3'*yi;
y3 = H3 * theta_3;
e3 = yi-y3;
q3 = e3'*e3;
s3 = sum(e3);
plot(ui,y3)

%%%%%%%%%%%%%%%%%%%%%
%hyperbolicka funkcia
l = ones(1,lenght(1,1))';
H4 = [l,ui.^-1];
theta_4 = inv(H4'*H4)*H4'*yi;
for i = 1:15
    y4(i) = theta_4(1) + theta_4(2)/ui(i);
end
y4 = y4';
% y4 = H4 * (theta_4/ui);
e4 = yi-y4;
q4 = e4'*e4;
s4 = sum(e4);
plot(ui,y4)

%%%%%%%%%%%%%%%%%%%%%
%exponencialna funkcia
l = ones(1,lenght(1,1))';
H5 = [l,exp(-0.3*ui)];
theta_5 = inv(H5'*H5)*H5'*yi;
y5 = H5*theta_5;
e5 = yi-y5;
q5 = e5'*e5;
s5 = sum(e5);
plot(ui,y5)

%%%%%%%%%%%%%%%%%%%%%
%logaritmicka funkcia
l = ones(1,lenght(1,1))';
H6 = [l,log(ui)];
theta_6 = inv(H6'*H6)*H6'*log(yi);
y6 = exp(theta_6(1))*ui.^(theta_6(2));
% y6 = H5*theta_6;
e6 = yi-y6;
q6 = e6'*e6;
s6 = sum(e6);
plot(ui,y6)

%%%%%%%%%%%%%%%%%%%%%
%exponencialno linearna funkcia
l = ones(1,lenght(1,1))';
H7 = [l,ui];
theta_7 = inv(H7'*H7)*H7'*log(yi);
y7 = exp(theta_7(1)+ui.*theta_7(2));
% y6 = H5*theta_6;
e7 = yi-y7;
q7 = e7'*e7;
s7 = sum(e7);
plot(ui,y7)


legend("Body","Linearna","Kvadraticka","Kubicka","Hyperbolicka","Exponencialna","Logaritmicka","exp-lineana")

