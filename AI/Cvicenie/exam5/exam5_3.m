% clear
% clc
% close all
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

set_param('exam3_3','FastRestart','on')
a = 1;
b = 0;
c = 0.01;

Pop3=genrpop(lpop,Space);
evolution3=zeros(1,numgen);
Fit3 = zeros(numgen,lpop);
for gen=1:numgen
    for i=1:lpop
        P3 = Pop3(i,1);
        I3 = Pop3(i,2);
        D3 = Pop3(i,3);
        try
            out1=sim("exam3_3");
            % Fit(gen,i) = sum(abs(out.e.Data));
            Fit3(gen,i) = sum(abs(out1.e.Data)+a*abs(out1.de.Data)+b*abs(out1.u.Data)+c*abs(out1.du.Data)); 
            % if(max(out1.y.Data)>max(out1.w.Data))
            %     Fit3(gen,i) = 10000;
            % end
        catch
            Fit3(gen,i) = 100000;
        end
    end
    evolution3(gen)=min(Fit3(gen,:));	% convergence graph of the solution
    % GA
    Best3=selbest(Pop3,Fit3(gen,:),[1,1,1,1,1]);
    Old3=selrand(Pop3,Fit3(gen,:),5);
    Work13 = selsus(Pop3,Fit3(gen,:),20);
    Work23 = selsus(Pop3,Fit3(gen,:),20);
    Work13=crossov(Work13,1,0);
    Work23=mutx(Work23,0.1,Space);
    Work23=muta(Work23,0.15,Delta,Space);
    Pop3=[Best3;Old3;Work13;Work23];
end
 % Best solution
figure(1);
plot(evolution3);
xlabel('generation');
ylabel('fitness');
hold on 
figure(2)
hold on
plot(out1.y)
plot(out1.w)
figure(3)
hold on
plot(out1.u)
save("exam5/overenie2/3.mat");
toc