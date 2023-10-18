clear
clc
close all
sim_time = 20;
sim_step = 1/200;

lpop = 50;
numgen=100;
u = 33.6;
lstring=3;
pid_space = u;

Space=[ones(1,lstring)*(0); ones(1,lstring)*pid_space];
Delta=Space(2,:)/100;   

set_param('exam3','FastRestart','on')


Pop=genrpop(lpop,Space);
for gen=1:numgen
    for i=1:lpop
        P = Pop(i,1);
        I = Pop(i,2);
        D = Pop(i,3);
        try
            out=sim("exam3");
            Fit(gen,i) = sum(abs(out.e.Data));
        catch
            Fit(gen,i) = 100000;
        end
    end
    evolution(gen)=min(Fit(gen,:));	% convergence graph of the solution

    % GA
    Best=selbest(Pop,Fit(gen,:),[7,3]);
    Old=selrand(Pop,Fit(gen,:),5);
    Work1 = selsus(Pop,Fit(gen,:),15);
    Work2 = selsus(Pop,Fit(gen,:),20);
    Work1=crossov(Work1,1,0);
    Work2=mutx(Work2,0.2,Space);
    Work2=muta(Work2,0.13,Delta,Space);
    Pop=[Best;Old;Work1;Work2];
    % Best solution
    figure(1);
    plot(evolution);
    xlabel('generation');
    ylabel('fitness');
    hold on 
end
figure(2)
hold on
plot(out.w)
plot(out.y)