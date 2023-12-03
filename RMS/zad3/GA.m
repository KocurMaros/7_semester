clc 
clear
close all
l = 0.58;
F_cart_num = [0	0	0.217598139970441];
F_cart_den = [2.813749053553513e-05	1	0];

F_pend_num = [-1.37069413493978	0	0];
F_pend_den = [1	0.0125366535496897	12.9568004970019];
sim_time = 100;
sim_step = 0.01; 

% lpop = 20;
% numgen=30;
lpop = 40;
numgen=30;
u = 5;
lstring=3;
pid_space = u;

Space=[ones(1,lstring)*(0); ones(1,lstring)*pid_space];
Space(2,1) = 2;
Space(2,2) = 2;
Delta=Space(2,:)/100;   

set_param('craneGA','FastRestart','on')

Pop=genrpop(lpop,Space);
evolutions=zeros(1,numgen);
Fit = zeros(1,lpop);
tic
e_min = 10e100;
for gen=1:numgen
    for i=1:lpop
        disp(gen+"/"+numgen+" "+ i)
        P = Pop(i,1);
        I = Pop(i,2);
        C = Pop(i,3);
        
        try
            out=sim("craneGA");
            % Fit(i) = sum(abs(out.e.Data)+abs(out.u.Data)+abs(out.e1.Data)+abs(out.u1.Data));
            Fit(i) = sum(abs(out.e.Data).^2+abs(out.y.Data).*2);
            if(max(out.y_motor.Data)>0.4)
                Fit(i) = 10e20;
            end
            if(Fit(i) < e_min)
                BEST.Pop = Pop;
                BEST.i = i;
            end
        catch
            Fit(i) = 10e20;
        end
    end
    evolutions1(gen)=min(Fit);	% convergence graph of the solution
    % GA
    Best=selbest(Pop,Fit,[2,1]);
    Old=selrand(Pop,Fit,6);
    Work1 = selsus(Pop,Fit,16);
    Work2 = selsus(Pop,Fit,15);
    Work1=crossov(Work1,1,0);
    Work2=mutx(Work2,0.2,Space);
    Work2=muta(Work2,0.25,Delta,Space);
    Pop=[Best;Old;Work1;Work2];
end
plot(evolutions1);
figure
plot(out.y)
% figure
% plot(out.u)
% hold on 
% plot(out.u1)
toc