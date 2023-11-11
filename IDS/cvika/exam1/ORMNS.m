function [Z_n, Ro_n,E_n,Theta_hat,G,Q_n] = ORMNS(Theta_hat,G,H,Q,y,n)
    Z_n = G*H';
    E_n=y-(H)*Theta_hat                         %theta so strieskou i
    Ro_n = (1/(1+(Z_n')*(Z_n)));
    Theta_hat = Theta_hat+Ro_n*E_n*G'*Z_n       %theta so strieskou i+1
    G = (eye(n,n)-(Ro_n/(1+sqrt(Ro_n)))*(Z_n)*Z_n')*G
    Q_n = Q+Ro_n*E_n^2
end