clear
clc
close all
tic
sim_time = 20;
sim_step = 1/200;

lpop = 50;
numgen=100;
u = 33.6;
lstring=3;
pid_space = u*2;

Space=[ones(1,lstring)*(0); ones(1,lstring)*pid_space];
Delta=Space(2,:)/100;   

set_param('exam3','FastRestart','on')
a = 1;
b = 0;
c = 0.01;

Pop=genrpop(lpop,Space);
evolutions=zeros(1,numgen);
Fit = zeros(numgen,lpop);
for gen=1:numgen
    for i=1:lpop
        P = Pop(i,1);
        I = Pop(i,2);
        D = Pop(i,3);
        try
            out=sim("exam3");
            % Fit(gen,i) = sum(abs(out.e.Data));
            Fit(gen,i) = sum(abs(out.e.Data)+a*abs(out.de.Data)+b*abs(out.u.Data)+c*abs(out.du.Data)); 
            if(max(out.e.Data) > 3)
                Fit(gen,i) = 100000;
            end
        catch
            Fit(gen,i) = 100000;
        end
    end
    evolutions(gen)=min(Fit(gen,:));	% convergence graph of the solution
    % GA
    Best=selbest(Pop,Fit(gen,:),[1,1,1,1,1]);
    Old=selrand(Pop,Fit(gen,:),5);
    Work1 = selsus(Pop,Fit(gen,:),20);
    Work2 = selsus(Pop,Fit(gen,:),20);
    Work1=crossov(Work1,1,0);
    Work2=mutx(Work2,0.1,Space);
    Work2=muta(Work2,0.15,Delta,Space);
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
toc