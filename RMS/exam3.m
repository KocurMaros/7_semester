close all
clc
clear
M_n = 6.4;     %Nm
T_n = 0.015; %s 
J_m = 0.005; %kgm^2
M_z0 = 0.033; %Nm
B = 0.0024;
Nel = 10000;    
Tvz = 0.004;  %s 

omega_0 = 7.4;
b_0 = 0.707;
k = 0.5;

k_i = omega_0^2*(2*b_0*k+1)*J_m;
k_v = omega_0*(2*b_0+k)*J_m-B;
k_p = (k*omega_0)/(2*b_0*k+1);

out = sim("exam3_sim.slx");

subplot(3,2,1);
hold on
plot(out.fi1z);
plot(out.fi1);
title("Zavyslost Fi motora od casu s IRC")
xlabel("Time[s]")
ylabel("fi[rad]")
legend("Fi^*","Fi_m")
% axis([0 5 -0.5 max(out.fi1.Data)+0.5]);
subplot(3,2,3);
hold on
plot(out.w1z);
plot(out.w1);
legend("w^*","w_m")
title("Zavyslost w motora od casu s IRC")
xlabel("Time[s]")
ylabel("w[rad/s]")
% axis([0 5 -1 56+0.5]);
subplot(3,2,2);
hold on
plot(out.fi2z);
plot(out.fi2);
xlabel("Time[s]")
ylabel("fi[rad]")
title("Zavyslost Fi motora od casu bez IRC")
legend("Fi^*","Fi_m")
% axis([0 5 -0.5 M_n+0.5]);
subplot(3,2,4);
hold on
plot(out.w2z);
plot(out.w2);
legend("w*","w_m")
xlabel("Time[s]")
ylabel("w[rad/s]")
title("Zavyslost w motora od casu bez IRC")
% axis([0 5 -1 56+0.5]);

subplot(3,2,5);
hold on
plot(out.e1);
xlabel("Time[s]")
ylabel("e")
title("Zavyslost e motora od casu s IRC")
subplot(3,2,6);
hold on
plot(out.e2);
xlabel("Time[s]")
ylabel("e")
legend("e_{IRC}","e")
title("Zavyslost e motora od casu bez IRC")

