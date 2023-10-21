close all
clc
clear
GA = 0;
param_pid = 1;


M_n = 6.4;     %Nm
T_n = 0.015; %s 
J_m = 0.005; %kgm^2
M_z0 = 0.033; %Nm
B = 0.0024;
Nel = 10000;    
Tvz = 0.004;  %s 
% 
sim_time = 4;
sim_step = 1/200;


%
if(GA == 0)
% 
    omega_0 = 24;
    b_0 = 0.707;
    k = 2;

    omega_0 = 30;
    b_0 = 0.707;
    k = 0.5;

    k_d = omega_0*(2*b_0+k)*J_m-B;
    k_p = omega_0^2*(2*b_0*k+1)*J_m;
    k_i = (k*omega_0^3)*J_m;
    % 
    disp("Simulation")
    % k_d = 0.1655;
    % k_p = 3.4062;
    % k_i = 30;

    % k = (k_i/J_m)/omega_0^3;
    % 
    % omega_0 = sqrt((k_p/J_m)/(2*b_0*k+1));

    out = sim("exam3_sim_2");
    
    figure(1)
    subplot(3,1,1)
    hold on
    plot(out.fi_in);
    plot(out.fi_out);
    title("Zavyslost Fi motora od casu")
    xlabel("Time[s]")
    ylabel("fi[rad]")
    legend("Fi^*","Fi_m")
    subplot(3,1,2)
    plot(out.w2);
    title("Rychlost motora od casu")
    xlabel("Time[s]")
    ylabel("v [rads-1]")
    subplot(3,1,3)
    plot(out.M);
    title("Moment motora od casu")
    xlabel("Time[s]")
    ylabel("J [nm]")
    
    sim_time = 4;
    sim_step = 1/200;

else
    if(param_pid == 1)

        disp("GA PID")
        lpop = 50;
        numgen=300;
        lstring=3;
        pid_space = 100;
        
        Space=[ones(1,lstring)*(0); ones(1,lstring)*pid_space];
        % Space(2,2) = 2;
        Delta=Space(2,:)/100;   
        
        set_param('exam3_sim_2','FastRestart','on')
        
        
        Pop=genrpop(lpop,Space);
        for gen=1:numgen
            for i=1:lpop
                % k_p = Pop(i,1);
                % k_i = Pop(i,2);
                % k_d = Pop(i,3);
                            
                omega_0 = Pop(i,1);
                b_0 = Pop(i,2);
                k = Pop(i,3);

                k_d = omega_0*(2*b_0+k)*J_m-B;
                k_p = omega_0^2*(2*b_0*k+1)*J_m;
                k_i = (k*omega_0^3)*J_m;
                try
                    out=sim("exam3_sim_2");
                    Fit(gen,i) = sum(abs(out.e.Data));
                catch
                    Fit(gen,i) = 100000;
                end
            end
            evolution(gen)=min(Fit(gen,:));	% convergence graph of the solution
            % GA
            Best=selbest(Pop,Fit(gen,:),[4,2]);
            Old=selrand(Pop,Fit(gen,:),7);
            Work1 = selsus(Pop,Fit(gen,:),17);
            Work2 = selsus(Pop,Fit(gen,:),20);
            Work1=crossov(Work1,1,0);
            Work2=mutx(Work2,0.2,Space);
            Work2=muta(Work2,0.15,Delta,Space);
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
        plot(out.fi_in)
        plot(out.fi_out)
        figure(3)
        plot(out.M)
        title("Moment motora od casu")
        xlabel("Time[s]")
        ylabel("J [nm]")
    else

        disp("param w_0 b_0 k")
        lpop = 50;
        numgen=100;
        lstring=3;
        pid_space = 30;
        
        Space=[ones(1,lstring)*(0); ones(1,lstring)*pid_space];
        Delta=Space(2,:)/100;   
        
        set_param('exam3_sim_2','FastRestart','on')
        
        
        Pop=genrpop(lpop,Space);
        for gen=1:numgen
            for i=1:lpop
                
                omega_0 = Pop(i,1);
                b_0 = Pop(i,2);
                k = Pop(i,3);

                k_d = omega_0*(2*b_0+k)*J_m-B;
                k_p = omega_0^2*(2*b_0*k+1)*J_m;
                k_i = (k*omega_0^3)*J_m;
                try
                    out=sim("exam3_sim_2");
                    Fit(gen,i) = sum(abs(out.e.Data));
                catch
                    Fit(gen,i) = 100000;
                end
            end
            evolution(gen)=min(Fit(gen,:));	% convergence graph of the solution
            % GA
            Best=selbest(Pop,Fit(gen,:),[4,2]);
            Old=selrand(Pop,Fit(gen,:),7);
            Work1 = selsus(Pop,Fit(gen,:),17);
            Work2 = selsus(Pop,Fit(gen,:),20);
            Work1=crossov(Work1,1,0);
            Work2=mutx(Work2,0.2,Space);
            Work2=muta(Work2,0.15,Delta,Space);
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
        plot(out.fi_in)
        plot(out.fi_out)
        figure(3)
        plot(out.M)
        title("Moment motora od casu")
        xlabel("Time[s]")
        ylabel("J [nm]")
    end
end