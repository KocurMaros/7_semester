% Odmocninová verzia RMNŠ
xi=[0,2.7,6.8,9,9.2,8.6,8,7.8,7.8,7.9,8].*7.5
N=7;
n=3;
H=zeros(N-n,n)
for i=1:(N-n)
    H(i,:)=[xi(i+1)-xi(i), xi(i+2)-xi(i), xi(i+3)-xi(i)]
end

y = -[xi(n+2)-xi(1) 
    xi(n+3)-xi(2)
    xi(n+4)-xi(3)
    xi(n+5)-xi(4)]

Theta_hat = zeros(n,1)
G=eye(n,n)*10^10
Q=zeros(5,1);
for i=1:4
    [Zn1, Ron1,En1,Theta_hat,G,Q] = RMNS(Theta_hat,G,H,Q,y,n,i)
end

function [Zn1, Ron1,En1,Theta_hat,G,Q] = RMNS(Theta_hat,G,H,Q,y,n,i)
    Zn1 = G*H(i,:)'
    Ron1 = (1/(1+(Zn1')*(Zn1)))
    En1=y(i,:)-(H(i,:))*Theta_hat
    Theta_hat = Theta_hat+Ron1*En1*G'*Zn1
    G = (eye(n,n)-(Ron1/(1+sqrt(Ron1)))*(Zn1)*Zn1')*G
    Q(i+1)=Q(i)+Ron1*En1^2
end
