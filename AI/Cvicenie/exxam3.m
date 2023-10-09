clear
clc 
close all
u_i = [1 5 10 20 30];

set_param('exam3','FastRestart','on')

for i = 1:5
    u = u_i(i);
   out = sim('exam3');
   figure(1)
   plot(out.y);
   hold on
   legend("u=1","u=5","u=10","u=20","u=30")
   axis([0 10 -1 5])
   prevodova(i) = out.y.Data(end);
end
i = 1;
for u_i = 1:0.5:30
   u = u_i;
   out = sim('exam3');
   prevodova(i) = out.y.Data(end);
   i = i + 1;
end
u_i = 1:0.5:30;
figure(2)
plot(u_i,prevodova,"-o");
xlabel("u");
ylabel("y");
title("prevodova charakteristika")
hold on

