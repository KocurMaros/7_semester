clear
clc
% close all
M_m = 0.108;
T_n = 0.001;
J_m = 0.00009;
J_z = 0.00024943;
M_z0m = 0.0052;
M_z0z = 0.0078;
B_m = 0.000080292;
B_z = 0.00020000;
N_el = 10000;
T_vz = 0.001;

K_e = 0.01;
B_e = 0.001;
tic
sim_time = 40;
sim_step = 0.001;
i_gear = 1;
Kp = 5;
Ki = 1.5;
Kd = 0.001;
sim("simulation.slx");

%probably best for now P=0.000391859203325225*100; I
%=0.000643542526164827*100; D = -1.27877742381949e-05; N= 5.60215976629348