function [H,Y] = h_creator(k,n,x_i)
    H = zeros(k,n);
    Y = zeros(k,1);
    for c = 1:k
        pos = 1;
        for cc = 1:n
            H(c,pos) = x_i(c+cc) - x_i(c); 
            pos = pos + 1;
        end
        Y(c) = -1*(x_i(n+c+1) - x_i(c));
    end
end

