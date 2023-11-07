function [Theta_hat,G,Q] = REFIL(Theta_hat,G,H,Q,Z,y,n,i)
%     Theta_hat=-g.*(1/ygam)
%     Q(i+1)=1/(ygam^2)
    z=Z(i,:)'
    f=G*z
    s2=zeros(n+2,1)
    s2(1)=1
    for j=2:n+2
        s2(j)=sqrt(s2(j-1)^2+f(j-1)^2)
    end
    G2=zeros(n+1,n+1)
    for k=1:n+1
        for l=1:n+1
            try
                G2(k,l)=(s2(k)/s2(k+1))*(G(k,l)-((f(k)/(s2(k)^2))*(sum(f(l:k-1).*G(l:k-1,l)))))
            catch
                G2(k,l)=0
            end
        end
    end
    G=G2
    g=G(n+1,1:n)'
    ygam = G(n+1,n+1)
    Theta_hat(:,i+1)=-g.*(1/ygam)
    Q(i+1)=1/(ygam^2)
end