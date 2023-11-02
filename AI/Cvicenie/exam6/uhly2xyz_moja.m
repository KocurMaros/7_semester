% Vypocet suradnic [x,y,z] zo vstupnych uhlov u1-u6

function[x,y,z]=uhly2xyz_moja(angles)
u1 = angles(1);
u2 = angles(2);
u3 = angles(3);
u4 = angles(4);
u5 = angles(5);
u6=0;


R1 = 0.188;
R2 = 1.175; 
R3 = 1.3; 
R4 = 0.2;
R6x = 0.3;
R6z = 0.1;

A= [cos(u1) -sin(u1) 0 0;sin(u1) cos(u1) 0 0;0 0 1 0;0 0 0 1];
B=[1 0 0 R1;0 1 0 0;0 0 1 0;0 0 0 1];
C = [cos(u2) 0 sin(u2) 0;0 1 0 0;-sin(u2) 0 cos(u2) 0;0 0 0 1]; % nova od fera
D=[1 0 0 0;0 1 0 0;0 0 1 R2;0 0 0 1];
E = [cos(u3) 0 sin(u3) 0;0 1 0 0;-sin(u3) 0 cos(u3) 0;0 0 0 1]; % nova od fera
F= [1 0 0 0;0 cos(u4) -sin(u4) 0;0 sin(u4) cos(u4) 0;0 0 0 1];
G=[1 0 0 R3;0 1 0 0;0 0 1 0;0 0 0 1];
H= [cos(u5) 0 sin(u5) 0;0 1 0 0;-sin(u5) 0 cos(u5) 0;0 0 0 1];
I=[1 0 0 R4;0 1 0 0;0 0 1 0;0 0 0 1];
J=[1 0 0 0;0 cos(u6) -sin(u6) 0;0 sin(u6) cos(u6) 0;0 0 0 1];

%TM = A*B*C*D*E*F*G*H;

%K2= A*B*C*[0;0;R2;1];
%K3= A*B*C*D*E*F*[R3;0;0;1];
KB= A*B*C*D*E*F*G*H*I*J*[R6x;0;-R6z;1];
x = KB(1);
y = KB(2);
z = KB(3);
% c=[KB(1:3)];

