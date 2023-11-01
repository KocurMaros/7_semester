function [y,e,de,dde,u,du] = skematika(signal,P,I,D)
    y = zeros(1,length(signal));
    e = zeros(1,length(signal));
    de = zeros(1,length(signal));
    dde = zeros(1,length(signal));
    u = zeros(1,length(signal));
    du = zeros(1,length(signal));
    e(1) = signal(1);
    u(1) = pid(e(1),P,I,D)*2;
        %%saturation      
    y(2) = u(1) - 0.8*y(1) - y(1)^3;
    for i = 2:length(signal)-1
        e(i) = signal(i) - y(i);
        u(i) = pid(e(i),P,I,D)*2;
        %%saturation
        y(i+1) = u(i) - 0.8*y(i) - y(i)^3 - 3*y(i-1);
    end
    de(2:length(de)) = e(1:length(e)-1);
    dde(2:length(de)) = e(1:length(e)-1);
    du(2:length(du)) = u(1:length(u)-1);
end