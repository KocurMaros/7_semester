close all

subplot(2,1,1);
plot(out.M_in);
hold on
plot(out.M_d);
plot(out.M_p);
legend("M*","M_d","M_p")
title("Momenty")
ylabel("M [Nm]")
subplot(2,1,2);
plot(out.w_z);
hold on;
plot(out.w_m);
plot(out.w_r);
title("Rychlost")
ylabel("w [rad/s]")
legend("w_z","w_m","w_r")