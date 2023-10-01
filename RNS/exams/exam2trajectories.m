for x10 = -1:0.1:1
    for x20 = -1:0.1:1
        out = sim("exam2_sim.slx");
        plot(out.x1,out.x2,'b');
    end  
    disp(x10)
end
