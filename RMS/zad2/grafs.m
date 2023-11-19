close all
clear
gears = [10,20,50];
pathto = "sims/GA2/gear";
load(pathto+"20"+"-myPI.mat");
figure(1)
hold on;
plot(out.w_in);
for i = 1:3
    i_gear = gears(i);
    out = sim("pi_simulation.slx");
    figure(1)
    hold on;
    plot(out.w_out);
    xlabel("Time [s]")
    ylabel("speed [rads-1]")
    % title("Zavyslost rychlosti zataze od casu s roznymi prevodovymi stupnami")
    figure(2)
    hold on;
    plot(out.w_m);
    xlabel("Time [s]")
    ylabel("speed [rads-1]")
    % title("Zavyslost rychlosti motora od casu s roznymi prevodovymi stupnami")
    figure(3)
    hold on;
    cas = out.M_dr.Time;
    Moment = out.M_dr.Data*5;
    plot(cas,Moment)
    xlabel("Time [s]")
    ylabel("M [Nm]")
    % title("Zavyslost momentu motora od casu s roznymi prevodovymi stupnami")
    figure(4)
    hold on;
    plot(out.M_pr)
    xlabel("Time [s]")
    ylabel("M [Nm]")
    % title("Zavyslost momentu zataze od casu s roznymi prevodovymi stupnami")
end
figure(1)
legend("ziadana","i=10","i=20","i=50")
figure(2)
legend("i=10","i=20","i=50")
figure(3)
legend("i=10","i=20","i=50")
figure(4)
legend("i=10","i=20","i=50")



close all
clear
gears = [0.5,0.05,0.005];
pathto = "sims/GA2/gear";
load(pathto+"20"+"-myPI.mat");
% figure(1)
% hold on;
% plot(out.w_in);
i_gear = 20;
for i = 1:3
    K_e = gears(i);
    out = sim("pi_simulation.slx");
    figure(1)
    hold on;
    plot(out.w_out);
    xlabel("Time [s]")
    ylabel("speed [rads-1]")
    % title("Zavyslost rychlosti zataze od casu s roznymi koeficientami tuhosti")
    figure(2)
    hold on;
    plot(out.w_m);
    xlabel("Time [s]")
    ylabel("speed [rads-1]")
    % title("Zavyslost rychlosti motora od casu s roznymi koeficientami tuhosti")
    figure(3)
    hold on;
    cas = out.M_dr.Time;
    Moment = out.M_dr.Data*5;
    plot(cas,Moment)
    xlabel("Time [s]")
    ylabel("M [Nm]")
    % title("Zavyslost momentu motora od casu s roznymi koeficientami tuhosti")
    figure(4)
    hold on;
    plot(out.M_pr)
    xlabel("Time [s]")
    ylabel("M [Nm]")
    % title("Zavyslost momentu zataze od casu s roznymi koeficientami tuhosti")
end
figure(1)
legend("Ke=0.5","Ke=0.05","Ke=0.005")
figure(2)
legend("Ke=0.5","Ke=0.05","Ke=0.005")
figure(3)
legend("Ke=0.5","Ke=0.05","Ke=0.005")
figure(4)
legend("Ke=0.5","Ke=0.05","Ke=0.005")



close all
clear
gears = [0.5,0.05,0.005];
pathto = "sims/GA2/gear";
load(pathto+"20"+"-myPI.mat");
% figure(1)
% hold on;
% plot(out.w_in);
i_gear = 20;

for i = 1:3
    B_e = gears(i);
    out = sim("pi_simulation.slx");
    figure(1)
    hold on;
    plot(out.w_out);
    xlabel("Time [s]")
    ylabel("speed [rads-1]")
    % title("Zavyslost rychlosti zataze od casu s roznymi koeficientami tlmenia")
    figure(2)
    hold on;
    plot(out.w_m);
    xlabel("Time [s]")
    ylabel("speed [rads-1]")
    % title("Zavyslost rychlosti motora od casu s roznymi koeficientami tlmenia")
    figure(3)
    hold on;
    cas = out.M_dr.Time;
    Moment = out.M_dr.Data*5;
    plot(cas,Moment)
    xlabel("Time [s]")
    ylabel("M [Nm]")
    % title("Zavyslost momentu motora od casu s roznymi koeficientami tlmenia")
    figure(4)
    hold on;
    plot(out.M_pr)
    xlabel("Time [s]")
    ylabel("M [Nm]")
    % title("Zavyslost momentu zataze od casu s roznymi koeficientami tlmenia")
end
figure(1)
legend("Be=0.5","Be=0.05","Be=0.005")
figure(2)
legend("Be=0.5","Be=0.05","Be=0.005")
figure(3)
legend("Be=0.5","Be=0.05","Be=0.005")
figure(4)
legend("Be=0.5","Be=0.05","Be=0.005")

% 
% gear = 10;
% pathto = "sims/GA2/gear";
% load(pathto+gear+"-myPI.mat");
% figure(1)
% hold on
% plot(out.w_in);
% plot(out.w_out);
% figure(2)
% hold on
% plot(out.u);
% gear = 20;
% load(pathto+gear+"-myPI.mat");
% figure(1)
% hold on
% plot(out.w_out);
% figure(2)
% plot(out.u);
% gear = 50;
% load(pathto+gear+"-myPI.mat");
% figure(1)
% plot(out.w_out);
% figure(2)
% plot(out.u);
% % load("sims/GA/gear100.mat")
% % figure(1)
% % plot(out.w_out);
% % load("sims/GA/gear50-PI.mat")
% % figure(1)
% % plot(out.w_out);
% % load("sims/GA/gear100-PI.mat")
% figure(1)
% % plot(out.w_out);
% legend("in","10PI","20PI","200PI")
% % legend("in","30","30PI","50","100","50PI","100PI")