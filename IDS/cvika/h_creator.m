function [H,Y] = h_creator(k,n,x_i)
    H = zeros(4,3);
    Y = zeros(4,1);
    g = 0;
    for c = 1:k
        pos = 1;
        for cc = 1:n
            H(c,pos) = x_i(c+cc+g) - x_i(c); 
            pos = pos + 1;
        end
        Y(c) = -1*(x_i(n+c) - x_i(c));
    g = g + 1;
    end
end

