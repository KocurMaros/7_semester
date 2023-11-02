A = 10;
w = 5;
M = 10;

T = 1/w;
K = (A*pi*w)/(2*M);

s = tf('s');
G = K/(s*(T*s+1)^2);


Re = -K*(2*T)/(1+T^2*w^2)^2;
Im = 0;

omega = logspace(-3,2,1e4);
nyquist(G,omega)
axis([-1.1 0.1 -0.3 0.2])
hold on 
grid on
plot([0 0],[-0.6 0.1],'k')
plot([-0.3 0],[Im Im],'r');

A1 = -(-0.785*4*M)/pi;

%%%%%%%%%%%% 
% vysledok zo simulinku
w1 = 2*pi/1.285;