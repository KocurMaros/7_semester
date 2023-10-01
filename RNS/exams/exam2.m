figure(1); hold on;
axis([-1 1 -1 1]);
grid on;
r= 0.03;
for x1 = -1:0.05:1
    for x2 = -1:0.05:1
        fi = atan2((6.5*x2^2-2/3*x1)*x2-x1-2*x1^2,x2);
        x1v = r*cos(fi);
        x2v = r*sin(fi);
        quiver(x1,x2,x1v,x2v,'k');
    end    
end