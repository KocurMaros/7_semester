% Preddefinované hodnoty
close all
population_size = 50;
num_variables = 10;
max_generations = 500;
F = 0.01; % Faktor škálovania
CR = 0.1; % Pravdepodobnosť kríženia

lstring=10;	% number of genes in a chromosome
M=500;          % maximum of the search space

figure(1); hold on;

% Population initialisation

Space=[ones(1,lstring)*(-M); ones(1,lstring)*M];
Delta=Space(2,:)/100;    % additive mutation step

% Inicializácia populácie
AP = 0;
for iteration = 1 :10
    population_new = genrpop(population_size,Space);
    for generation = 1:max_generations
        % Výpočet fitness
        fitness = testfn3(population_new);
        population = population_new;
        % Cyklus evolúcie
        for i = 1:population_size
            % Mutácia
            r = randperm(population_size, 3);
            v = population(r(1), :) + F * (population(r(2), :) - population(r(3), :));
            % if(max(v) > 500 || min(v)<-500)
            %     disp(v)
            % end
            % Kríženie
            jrand = randi(num_variables);
            u = population(i, :);
            for j = 1:num_variables
                if rand < CR    % rand = ro
                    u(j) = v(j);
                end
            end
            
            % Ohodnotenie
            trial_fitness = testfn3(u);
            if trial_fitness < fitness(i)
                population_new(i, :) = u;
            elseif trial_fitness >= fitness(i)
                population_new(i, :) = population(i, :);
            end
        end
        evolution(generation)=min(fitness);
        % if(evolution(generation)<-4300)
        %     disp(testfn3(population_new))
        %     disp(population_new(generation))
        % end
        % Grafické zobrazenie vývoja
        
    end
    hold on;
    figure(2);
    hold on;
    plot(evolution);
    AP = AP + evolution;
    
end
figure(1);
hold on;
plot(AP/10); 
numgen=500;	% number of generations
lpop=50;	% number of chromosomes in population
lstring=10;	% number of genes in a chromosome
M=500;  
AP = 0;
for i=1:10
    Pop=genrpop(lpop,Space);
    for gen=1:numgen
    
        Fit=testfn3(Pop);
    
        evolution(gen)=min(Fit);	% convergence graph of the solution
    
        % GA
        Best=selbest(Pop,Fit,[1,0,0]);
        Old=selrand(Pop,Fit,20);
        Work1 = selrand(Pop,Fit,17);
        Work2 = seltourn(Pop,Fit,12);
        Work1=crossov(Work1,1,0);
        Work2=mutx(Work2,0.08,Space);
        Work2=muta(Work2,0.1,Delta,Space);
        Pop=[Best;Old;Work1;Work2];
    
    end;  % gen
    % Best solution
    AP = AP + evolution;
    % figure(1);
    % plot(evolution);');
    xlabel('generation');
    ylabel('fitness');
    hold on 
end
plot(AP/10);
legend("DE","GA");