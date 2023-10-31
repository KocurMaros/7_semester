  
u = (0.8*4+64)/2;
alfa=2;
beta=0;
Index=0;
size = zeros(2,3);
size(1,:) = 0;
size(2,:) = 2*u;
A = 5*[1 1 1];
generations = 50;
plotingArr =[];
popSize = 50;

population = genrpop(popSize , size);
% set_param('UM3',"FastRestart","on")
plotingArraay = zeros(1,generations);
for i=1:generations
    fitness = ones(1,popSize);
    for pop=1:popSize
        P=population(pop,1);
        I=population(pop,2);
        D=population(pop,3);
        try
            x=sim('UM3');
            fitness(pop) = sum(abs(x.e)+alfa*abs(x.ed)+beta*abs(x.edd))';
        catch
            fitness(pop) = 1000000;
        end
       
    end
        
          
      plotingArraay(i)=min(fitness);
      NewPop = selbest(population,fitness, [1 2 3]);
      addPop = [selrand(population,fitness,28);seltourn(population,fitness,16)];     
       
        % NewPop = selbest(population,fitness, [1 1]);
        % addPop = [selrand(population,fitness,4);seltourn(population,fitness,4)];     

        addPop = crossov(addPop,1,1);
        addPop = crossov(addPop,1,1);
        addPop = mutx(addPop, 0.05 , size);
        addPop = muta(addPop, 0.08 , A, size);
        population = [NewPop; addPop];
        
    plot(x.simout.Time,x.simout.Data);
    hold on;
    grid on
    ylim([-0.5 5])
end

f=figure
P=population(50,1);
I=population(50,2);
D=population(50,3);
x=sim('UM3');
plot(x.simout.Time,x.simout.Data);
grid on
f=figure
plot(1:length(plotingArraay),plotingArraay,'r')
grid on

f=figure
plot(x.simout.Time,x.u);
grid on
    