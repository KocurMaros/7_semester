clc
clear 
close all

load("odovzdanie4.mat")

plot3(Points(1,:),Points(2,:),Points(3,:),'o')
hold on
plot3(BEST.x,BEST.y,BEST.z,'x')
u_ind = find(evolutions == 0);
u_index = min(u_ind);
figure(2)
plot(evolutions(1:u_index-1));
figure(3)
plot(evol_pp(1:u_index-1));
figure(4)
plot(evol_sn(1:u_index-1));

disp("best")
disp("PP")
disp(BEST.PP_best)
disp("SN")
disp(BEST.SN_best)
disp("angles")
for i = 1:6
    offset = (i-1)*6+1;
    disp(BEST.joints(offset+0)+" "+BEST.joints(offset+1)+" "+BEST.joints(offset+2)+" "+BEST.joints(offset+3)+" "+BEST.joints(offset+4)+" "+BEST.joints(offset+5))
end
% disp(BEST.joints)
disp("coord of points")
disp(BEST.x)
disp(BEST.y)
disp(BEST.z)

for j = 1:6
    disp("Point "+(j-1))
    disp(sqrt((Points(1,j)-BEST.x(j))^2+(Points(2,j)-BEST.y(j))^2+(Points(3,j)-BEST.z(j))^2))
end
%%%
%PP
%SN
%angles
%vsetky body 
%odchylky v bodoch