clear
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
% Space(2,4) = 10;
% Space(2,4) = 5;
% Space(2,4) = 5;
set_param('exam3','FastRestart','on')
a = 1;
b = 0;
c = 0.01;

Pop=genrpop(lpop,Space);
evolutions=zeros(1,numgen);
Fit = zeros(numgen,lpop);
sig = 0:sim_step:20;
time_x = 0:sim_step:20;
first_step = find(sig == 1);
second_step = find(sig == 5);

sig(1:first_step) = 0;
sig(first_step:second_step) = 3;
sig(second_step:end) = 1;
for gen=1:numgen
    for i=1:lpop
        P = Pop(i,1);
        I = Pop(i,2);
        D = Pop(i,3);
        % a = Pop(i,4);
        % b = Pop(i,5);
        % c = Pop(i,6);
        try
            out=sim("exam3");
            Fit(gen,i) = sum(abs(out.e.Data)+a*abs(out.de.Data)+b*abs(out.u.Data)+c*abs(out.du.Data)); 
            if(max(out.y.Data(first_step:second_step)) > 3)
                Fit(gen,i) = 10000;
            end
            if(min(out.y.Data(second_step:end)) < 1)
                Fit(gen,i) = 10000;
            end
            % [y,e,de,dde,u,du] = skematika(sig,P,I,D);
            % Fit(gen,i) = sum(abs(out.e.Data));
            % Fit(gen,i) = sum(abs(e)+a*abs(de)+b*abs(u)+c*abs(du)); 
        
            % lower_index = find(out.e.Time == 1);
            % upper_index = find(out.e.Time == 6);
            % trash = decide_if_value_in_interval_is_less_than_input_value(out.y.Data, out.w.Data, lower_index, upper_index);
            % if(sum(trash == 1) < sum(trash == 0))
            %     Fit(gen,i) = 100000;
            % else
            %     Fit(gen,i) = sum(abs(out.e.Data));
            % end
        catch
            Fit(gen,i) = 100000;
        end
    end
    evolutions(gen)=min(Fit(gen,:));	% convergence graph of the solution
    % GA
    Best=selbest(Pop,Fit(gen,:),[1,1,1]);
    Old=selrand(Pop,Fit(gen,:),5);
    Work1 = selsus(Pop,Fit(gen,:),21);
    Work2 = selsus(Pop,Fit(gen,:),21);
    Work1=crossov(Work1,1,0);
    Work2=mutx(Work2,0.1,Space);
    Work2=muta(Work2,0.15,Delta,Space);
    Pop=[Best;Old;Work1;Work2];
end
 % Best solution
figure(1);
plot(evolutions);
xlabel('generation');
ylabel('fitness');
hold on 
figure(2)
hold on
plot(out.w)
plot(out.y)
figure(3)
hold on
plot(out.u)
save("exam5/test2.mat");
toc