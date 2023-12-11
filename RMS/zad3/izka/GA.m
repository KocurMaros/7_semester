clc 
clear
close all
l = 0.7826;
N_el_bremeno = 4.18e+3;
N_el_vozik = 4.18e+3;
F_cart_num = [0	0	0.42];
F_cart_den = [0.09763	1	0];

F_pend_num = [-1.214	0	0];
F_pend_den = [1	0.01135	12.54];
sim_time = 60; 
sim_step = 0.01; 

% lpop = 20;
% numgen=30;
lpop = 40;
numgen=20;
u = 10;
lstring=5;
pid_space = u;

Space=[ones(1,lstring)*(0); ones(1,lstring)*pid_space];
Space(2,5) = 100;
Delta=Space(2,:)/100;   

set_param('crane_izka','FastRestart','on')

Pop=genrpop(lpop,Space);
evolutions=zeros(1,numgen);
Fit = zeros(1,lpop);
tic
e_min = 10e100;


sig = 0:sim_step:sim_time;
first_step = find(sig == 10);
second_step = find(sig == 35);


for gen=1:numgen
    for i=1:lpop
        P = Pop(i,1);
        I = Pop(i,2);
        P1 = Pop(i,3);
        I1 = Pop(i,4);
        C = Pop(i,5);
        
        try
            out=sim("crane_izka");
            % Fit(i) = sum(abs(out.e.Data)+abs(out.u.Data)+abs(out.e1.Data)+abs(out.u1.Data));

            % overshoot1 = calculate_overshoot(out.y_motor.Data(first_step:second_step));
            % overshoot2 = calculate_overshoot(out.y_motor.Data(second_step:end));
            % 
            % rise1 = calculate_rise_time(out.y_motor.Time(first_step:second_step),out.y_motor.Data(first_step:second_step),40);
            % rise2 = calculate_rise_time(out.y_motor.Time(second_step:end),out.y_motor.Data(second_step:end),60);
            % 
            % settle1 = calculate_settling_time(out.y_motor.Time(first_step:second_step),out.y_motor.Data(first_step:second_step),40);
            % settle2 = calculate_settling_time(out.y_motor.Time(second_step:end),out.y_motor.Data(second_step:end),60);
            % 
            % Fit(i) = abs(1.2 * overshoot1+ 1.2 * overshoot2 + 0.6 * rise1 +0.6 * rise2 + 0.8 * settle1 +0.8 * settle2 + sum(abs(out.e.Data).*2 + 5*abs(out.y.Data)));

            % Fit(i) = sum(abs(out.e.Data)+abs(out.de.Data)+abs(out.y.Data));
            Fit(i) = sum(abs(out.e.Data).^2 + abs(out.y.Data)); % +abs(out.u.Data)
            % out.w.Data(first_step:second_step) = out.w.Data(first_step:second_step) - 0.2; 
            % trash = decide_if_value_in_interval_is_less_than_input_value(out.y_motor.Data, out.w.Data, first_step, second_step);
            % trash = decide_if_value_in_interval_is_less_than_input_value(out.y_motor.Data, out.w.Data, 1, first_step);
            
            % trash2 = decide_if_value_in_interval_is_more_than_input_value(out.y_motor.Data, out.w.Data-0.05, second_step);
            % 
            % if(sum(trash == 1) < sum(trash == 0))
            %     Fit(i) = 10e20;
            % end
            % if(max(out.w.Data(1:first_step)) < 0.28)
            %     Fit(i) = 10e20;
            % end
            
            % if(sum(trash2 == 1) < sum(trash2 == 0))
            %     Fit(i) = 10e20;
            % end
            % 
            % if(max(out.y_motor.Data)>0.3)
            %     Fit(i) = 10e20;
            % end
            if(Fit(i) < e_min)
                BEST.Pop = Pop;
                BEST.i = i;
            end
        catch
            Fit(i) = 10e20;
        end
        disp(gen+"/"+numgen+" "+ i + " " + Fit(i))
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
save("meranie_6_4.mat");
toc