clc 
clear

M = 8;
d = 0.8;

korene = roots([1 0 1 -(2*M)/(pi*d)]);

omega = korene(3);

Re = -(1/((omega^2+1)*2));
Im = -(d*pi/(4*M));
A = sqrt((Re^2*4^2*M^2)/(pi^2)+d^2);

s = tf('s');0
G = 1/(2*s*(s+1));

omega = logspace(-0.4,2,1e4);
nyquist(G,omega)
axis([-0.3 0.1 -0.3 0.1])
hold on 
grid on
plot([0 0],[-0.6 0.1],'k')
plot([-0.3 0],[Im Im],'r');

%odcitane z grafu a overenie vypoctu A 
Re = -0.131;
A = sqrt((Re^2*4^2*M^2)/(pi^2)+d^2);
dT = 3.732;