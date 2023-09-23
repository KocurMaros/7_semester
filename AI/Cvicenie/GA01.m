% Simple GA
% Ivan Sekaj, 2022
% ==================
close all;
numgen=750;	% number of generations
lpop=50;	% number of chromosomes in population
lstring=10;	% number of genes in a chromosome
M=750;          % maximum of the search space

figure(1); hold on;

% Population initialisation

Space=[ones(1,lstring)*(-M); ones(1,lstring)*M];
Delta=Space(2,:)/100;    % additive mutation step

A = ones(1,10)*10;
% Pop=genrpop(lpop,Space);
% ap_all = zero(4,numgen);
AP = 0;
% Main cyklus ---------------------------------
for i=1:10
    Pop=genrpop(lpop,Space);
    for gen=1:numgen

        Fit=testfn3(Pop);

        evolution(gen)=min(Fit);	% convergence graph of the solution

        % GA
        Best=selbest(Pop,Fit,[15,10]);
        Old=selrand(Pop,Fit,4);
        Work1 = seltourn(Pop,Fit,7);
        Work2 = selsus(Pop,Fit,7);
        Work1=crossov(Work1,1,0);
        Work2=mutx(Work2,0.05,Space);
        Work2=muta(Work2,0.08,Delta,Space);
        Pop=[Best;Old;Work1;Work2];

    end;  % gen
    % Best solution
    AP = AP + evolution;
    figure(1);
    plot(evolution);
    title('Vysoky tlak nizka diverzifikacia');
    xlabel('generation');
    ylabel('fitness');
    hold on 
end
ap_all(1,:) = AP/10;
plot (AP/10, 'r--', 'LineWidth',2);
% -------------------------------------------------
AP = 0;
% Main cyklus  ---------------------------------
for i=1:10
    Pop=genrpop(lpop,Space);
    for gen=1:numgen

        Fit=testfn3(Pop);

        evolution(gen)=min(Fit);	% convergence graph of the solution

        % GA
        Best=selbest(Pop,Fit,[15,10]);
        Old=selrand(Pop,Fit,4);
        Work1 = selrand(Pop,Fit,7);
        Work2 = selsus(Pop,Fit,7);
        Work1=crossov(Work1,1,0);
        Work2=mutx(Work2,0.2,Space);
        Work2=muta(Work2,0.2,Delta,Space);
        Pop=[Best;Old;Work1;Work2];

    end;  % gen
    % Best solution
    AP = AP + evolution;
    figure(2);
    plot(evolution);
    title('Vysoky tlak vysoka diverzifikacia');
    xlabel('generation');
    ylabel('fitness');
    hold on 
end
ap_all(2,:) = AP/10;
plot (AP/10, 'r--', 'LineWidth',2);

AP = 0;
% Main cyklus ---------------------------------
for i=1:10
    Pop=genrpop(lpop,Space);
    for gen=1:numgen
    
        Fit=testfn3(Pop);
    
        evolution(gen)=min(Fit);	% convergence graph of the solution
    
        % GA
        Best=selbest(Pop,Fit,[1,0,0]);
        Old=selrand(Pop,Fit,20);
        Work1 = selrand(Pop,Fit,12);
        Work2 = seltourn(Pop,Fit,15);
        Work1=crossov(Work1,1,0);
        Work2=mutx(Work2,0.08,Space);
        Work2=muta(Work2,0.1,Delta,Space);
        Pop=[Best;Old;Work1;Work2];
    
    end;  % gen
    % Best solution
    AP = AP + evolution;
    figure(3);
    plot(evolution);
    title('Nizky tlak nizka diverzifikacia');
    xlabel('generation');
    ylabel('fitness');
    hold on 
end
ap_all(3,:) = AP/10;
plot (AP/10, 'r--', 'LineWidth',2);
% -------------------------------------------------
AP = 0;
% Main cyklus ---------------------------------
for i=1:10
    Pop=genrpop(lpop,Space);
    for gen=1:numgen
    
        Fit=testfn3(Pop);
    
        evolution(gen)=min(Fit);	% convergence graph of the solution
    
        % GA
        Best=selbest(Pop,Fit,[1,0,0]);
        Old=selrand(Pop,Fit,20);
        Work1 = selrand(Pop,Fit,10);
        Work2 = seltourn(Pop,Fit,10);
        Work1=crossov(Work1,1,0);
        Work2=mutx(Work2,0.3,Space);
        Work2=muta(Work2,0.4,Delta,Space);
        Pop=[Best;Old;Work1;Work2];
    
    end;  % gen
    % Best solution
    AP = AP + evolution;
    figure(4);
    plot(evolution);
    title('nizky tlak vysoka diverzifikacia');
    xlabel('generation');
    ylabel('fitness');
    hold on 
end
ap_all(4,:) = AP/10;
plot (AP/10, 'r--', 'LineWidth',2);
for i = 1:4
    figure(5);
    hold on
    plot(ap_all(i,:))
    legend("VTND","VTVD","NTND","NTVD")
end