clear
clc
close all
tic

lpop = 40;
numgen=5000;
num_points = 6;
joints = 6;
lstring=joints*num_points;
space_dim = pi;

Space=[ones(1,lstring)*(-space_dim); ones(1,lstring)*space_dim];
Delta=Space(2,:)/100;   

Pop=genrpop(lpop,Space);

evolutions=zeros(1,numgen);
Fit = zeros(1,lpop);
P0=[1.988; 0; 1.075]; 
P1=[1; 0; -0.4];
P2=[0.8; 0;1]; 
P3=[0; 0.5; 1];
P4=[-0.75;0.5; 0];
Points = [P0,P1,P2,P3,P4,P0];
alfa = 0.05;
end_points = zeros(3,6);
graph = zeros(3,6);
evol_sn = zeros(1,numgen);
evol_pp = zeros(1,numgen);
step_angles = 0:6:35;
pp_all = zeros(1,lpop);
sn_all = zeros(1,lpop);
BEST.PP_best = 100000;
BEST.SN_best = 100000;
coords = zeros(3,num_points);
for gen=1:numgen
    for i=1:lpop
        PP = 0;
        SN = 0;
        error_angle = 0;
       for j=1:num_points
            offset = (j-1)*6+1;
            [x,y,z] = uhly2xyz_moja(Pop(i,offset:offset+5));
            PP = PP + sqrt((Points(1,j)-x)^2+(Points(2,j)-y)^2+(Points(3,j)-z)^2);
            % SN = SN + abs(sum(Pop(i,offset:offset+5)));
            coords(1,j) = x;
            coords(2,j) = y;
            coords(3,j) = z;
       end
       for j = 1:num_points-1
           for g = 1:num_points
                error_angle = error_angle + abs(Pop(i,step_angles(j)+g) - Pop(i,step_angles(j+1)+g));
           end
       end
       if(PP < BEST.PP_best)
            BEST.PP_best = PP;
            BEST.SN_best = error_angle;
            BEST.x = coords(1,:);
            BEST.y = coords(2,:);
            BEST.z = coords(3,:);
            BEST.joints = Pop(i,:);
       end
       pp_all(i) = PP;
       sn_all(i) = error_angle;
       Fit(i) = PP + alfa*error_angle;
    end

    evol_pp(gen) = min(pp_all);
    evol_sn(gen) = min(sn_all);
    evolutions(gen)=min(Fit);	% convergence graph of the solution
    
    % GA
    Best=selbest(Pop,Fit,[1,1]);
    Old=selrand(Pop,Fit,5);
    Work1 = selsus(Pop,Fit,16);
    Work2 = selsus(Pop,Fit,17);
    Work1=crossov(Work1,1,0);
    Work2=mutx(Work2,0.1,Space);
    Work2=muta(Work2,0.15,Delta,Space);
    Pop=[Best;Old;Work1;Work2];
    if(PP < 0.008 && error_angle < 28)
        break;
    end
end
 % Best solution
figure(1);
plot(evolutions);
xlabel('generation');
ylabel('fitness');
% % save("test1.mat");
figure(2)
plot(evol_pp)
figure(3)
plot(evol_sn)
min(evol_pp)
toc