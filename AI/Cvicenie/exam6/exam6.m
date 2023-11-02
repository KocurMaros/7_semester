clear
clc
close all
tic

lpop = 50;
numgen=100;
num_points = 6;
joints = 6;
lstring=joints*num_points;
space_dim = pi;

Space=[ones(1,lstring)*(-space_dim); ones(1,lstring)*space_dim];
Delta=Space(2,:)/100;   

Pop=genrpop(lpop,Space);

evolutions=zeros(1,numgen);
Fit = zeros(numgen,lpop);
P0=[1.988; 0; 1.075]; 
P1=[1; 0; -0.4];
P2=[0.8; 0;1]; 
P3=[0; 0.5; 1];
P4=[-0.75;0.5; 0];
Points = [P0,P1,P2,P3,P4,P0];
alfa = 0.5;
end_points = zeros(3,6);
for gen=1:numgen
    for i=1:lpop
       for j=1:num_points
            offset = (j-1)*6+1;
            [x,y,z] = uhly2xyz_moja(Pop(i,offset:offset+5));
            PP = sqrt((Points(1,j)-x)^2+(Points(2,j)-y)^2+(Points(3,j)-z)^2);
            SN = sum(Pop(i,offset:offset+5));
            Fit(gen,i) = PP + alfa*SN;
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
figure(3)
hold on
save("test1.mat");
toc