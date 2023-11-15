close all

subplot(2,1,1);
hold on
plot(out.M_mr);
plot(out.M_dr);
plot(out.M_m1);
plot(out.M_d1);
legend("M*","M_d","M_p")
title("Momenty")
ylabel("M [Nm]")
subplot(2,1,2);
plot(out.w_ziadane);
hold on;
plot(out.w_z1);
plot(out.w_zr);
title("Rychlost")
ylabel("w [rad/s]")
legend("w_z","w_m","w_r")