function [Zn1, Ron1,En1,Theta_hat,G,Q] = RMNS(Theta_hat,G,H,Q,y,n,i)
    Zn1 = G*H(i,:)'
    Ron1 = (1/(1+(Zn1')*(Zn1)))
    En1=y(i,:)-(H(i,:))*Theta_hat
    Theta_hat = Theta_hat+Ron1*En1*G'*Zn1
    G = (eye(n,n)-(Ron1/(1+sqrt(Ron1)))*(Zn1)*Zn1')*G
    Q(i+1)=Q(i)+Ron1*En1^2
end
