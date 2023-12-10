clc
clear
close all
load final.mat
figure(1)
plot(out.in_x.Data,out.in_y.Data)
hold on
plot(out.out_x.Data,out.out_y.Data)
plot(out.out_effector_x.Data,out.out_effector_y.Data)
figure(2)
hold on
plot(out.in_x.Data,out.in_y.Data)

clear

load meass/final.mat

posX_cart = data(:,3);
phiX_effector = data(:,4);

posY_cart = data(:,7);
phiY_effector = data(:,8);

posX_effector = sin(phiX_effector)*lano+posX_cart;
posY_effector = sin(phiY_effector)*lano+posY_cart;
plot(posX_cart,posY_cart)
plot(posX_effector,posY_effector)
grid on
legend("ziadana","poloha vozika","poloha effectora")