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
a = 1;
b = 0;
c = 0.01;

Pop=genrpop(lpop,Space);
for gen=1:numgen
    for i=1:lpop
        P = Pop(i,1);
        I = Pop(i,2);
        D = Pop(i,3);
        try
            out=sim("exam3");
            % Fit(gen,i) = sum(abs(out.e.Data));
            Fit(gen,i) = sum(abs(out.e.Data)+a*abs(out.de.Data)+b*abs(out.u.Data)+c*abs(out.du.Data));        
            % if(max(out.y.Data) > max(out.w.Data))
            %     Fit(gen,i) = 100000;
            % end
        catch
            Fit(gen,i) = 100000;
        end
    end
    evolution(gen)=min(Fit(gen,:));	% convergence graph of the solution
    % GA
    Best=selbest(Pop,Fit(gen,:),[5,2]);
    Old=selrand(Pop,Fit(gen,:),5);
    Work1 = selsus(Pop,Fit(gen,:),18);
    Work2 = selsus(Pop,Fit(gen,:),20);
    Work1=crossov(Work1,1,0);
    Work2=mutx(Work2,0.25,Space);
    Work2=muta(Work2,0.17,Delta,Space);
    Pop=[Best;Old;Work1;Work2];
end
 % Best solution
figure(1);
plot(evolution);
xlabel('generation');
ylabel('fitness');
hold on 
figure(2)
hold on
plot(out.w)
plot(out.y)
figure(3)
plot(out.u)
% legend("a=3 b=0 c=0.05 ","a=5 b=0.01 c=0.1 ","a=15 b=0 c=0.5 ")