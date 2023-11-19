
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

i_gear = 100;
K_e = 0.5;
B_e = 0.05;
tic
sim_time = 20;
sim_step = 0.001;

lpop = 20;
numgen=30;
u = 1;
lstring=3;
pid_space = u*2;

Space=[ones(1,lstring)*(0); ones(1,lstring)*pid_space];

Delta=Space(2,:)/100;   

set_param('pi_simulation','FastRestart','on')

Pop=genrpop(lpop,Space);
evolutions=zeros(1,numgen);
Fit = zeros(1,lpop);

e_min = 10e100;
for gen=1:numgen
    for i=1:lpop
        disp(gen+"/"+numgen+" "+ i)
        param(1) = Pop(i,1);
        param(2) = Pop(i,2);
        param(3) = Pop(i,3);
        try
            out=sim("pi_simulation");
            Fit(i) = sum(abs(out.e.Data)+abs(out.u.Data));
            if(Fit(i) <e_min)
                BEST.Pop = Pop;
                BEST.param = param;
                BEST.i = i;
                BEST.e = out.e;
                BEST.u = out.u;
            end
        catch
            Fit(i) = 10e20;
        end
    end
    evolutions1(gen)=min(Fit);	% convergence graph of the solution
    % GA
    Best=selbest(Pop,Fit,[1]);
    Old=selrand(Pop,Fit,3);
    Work1 = selsus(Pop,Fit,8);
    Work2 = selsus(Pop,Fit,8);
    Work1=crossov(Work1,1,0);
    Work2=mutx(Work2,0.2,Space);
    Work2=muta(Work2,0.25,Delta,Space);
    Pop=[Best;Old;Work1;Work2];
end
 % Best solution
% figure(1);
% plot(evolutions1);
% xlabel('generation');
% ylabel('fitness');
% hold on 
% figure(2)
% hold on
% plot(out.w_in)
% plot(out.w_out)
% figure(3)
% hold on
% plot(out.u)
% save("sims/testy/10.mat");
toc