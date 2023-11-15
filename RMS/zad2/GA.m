clear
clc
close all
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

i = 5;
K_e = 0.01;
B_e = 0.001;
tic
sim_time = 10;
sim_step = 0.001;

lpop = 50;
numgen=100;
u = 33.6;
lstring=2;
pid_space = u*2;

Space=[ones(1,lstring)*(0); ones(1,lstring)*pid_space];
Delta=Space(2,:)/100;   

set_param('simulation2023a','FastRestart','on')
a = 1;
b = 0;
c = 0.01;

Pop1=genrpop(lpop,Space);
evolutions1=zeros(1,numgen);
Fit1 = zeros(numgen,lpop);
sig = 0:sim_step:sim_time;
time_x = 0:sim_step:sim_time;
first_step = find(sig == 1);
% second_step = find(sig == 6);

for gen1=1:numgen
    gen1
    for i=1:lpop
        i
        P = Pop1(i,1);
        I = Pop1(i,2);
        try
            out=sim("simulation2023a");
            Fit(gen,i) = sum(abs(out.e.Data));

            trash = decide_if_value_in_interval_is_less_than_input_value(out.w_zr.Data, out.w_ziadane.Data, first_step, end);
            trash2 = decide_if_value_in_interval_is_more_than_input_value(out.w_zr.Data, out.w_ziadane.Data, first_step);
            
            if(sum(trash == 1) < sum(trash == 0))
                Fit1(gen1,i) = 100000;
            end
            if(sum(trash2 == 1) < sum(trash2 == 0))
                Fit1(gen1,i) = 100000;
            end
        catch
            Fit1(gen1,i) = 100000;
        end
    end
    evolutions1(gen1)=min(Fit1(gen1,:));	% convergence graph of the solution
    % GA
    Best1=selbest(Pop1,Fit1(gen1,:),[1,1,1,1,1]);
    Old1=selrand(Pop1,Fit1(gen1,:),5);
    Work1 = selsus(Pop1,Fit1(gen1,:),20);
    Work2 = selsus(Pop1,Fit1(gen1,:),20);
    Work1=crossov(Work1,1,0);
    Work2=mutx(Work2,0.1,Space);
    Work2=muta(Work2,0.15,Delta,Space);
    Pop1=[Best1;Old1;Work1;Work2];
end
 % Best solution
figure(1);
plot(evolutions1);
xlabel('generation');
ylabel('fitness');
hold on 
figure(2)
hold on
plot(out.y)
plot(out.w)
figure(3)
hold on
plot(out.u)
save("exam5/overenie2/1.mat");
toc