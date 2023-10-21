clear
clc
e_mm = [100 140];
w_mm = [70 250];

% u1 = ( ui - (max(e_mm)+min(e_mm))/2)/((max(e_mm)-min(e_mm))/2);
% u2 = ( ui - (max(w_mm)+min(w_mm))/2)/((max(w_mm)-min(w_mm))/2);
n = 2;
q = 3;
u = [-1 1];
% e = 20*u1 + 120;
% w = 90*u2 + 160;

H = [1 1 1; 1 1 -1; 1 -1 1; 1 -1 -1];
y = [5.7 15.8 0.8 9.6];

theta = zeros(3,1);
for i = 1:3
    for j = 1:4
        theta(i) = theta(i) + H(j,i)*y(j);
    end
        theta(i) = theta(i)/4;
end
y_s = H*theta; %y so strieskov

%%%%%%%%%%%%%%%%%%%%%%%5
%STATISTICKA VYZNAMNIST KOEFICIENTOV
% Q = zeros(3,1);
% for i = 1:3
%     for j = 1:4
%         Q(i) = Q(i) + H(j,i)*y(j);
%     end
%         Q(i) = Q(i)/4;
% end
Q = 8*0.1^2 + 3*0.2^2; %Q y s pruhom
ni = 2^2*(3-1); % ni s prugom 
S_y = Q/ni;
S_theta = S_y/4;

delta = sqrt(S_theta)*tinv(0.975,ni);

%%%%%%%%%%%%%%%%%%5
%F test
S_y_v = 0;
for i = 1:4
    S_y_v = S_y_v+(y(i)-y_s(i))^2; % S s y s vlnkov na 2
end
S_y_v = (1/(2^2-2-1))*3*S_y_v;

w_1delta = finv(0.95,1,8); %w index 1-delta
w = S_y_v/S_y;
if(w <= w_1delta)
    disp("mode je adekvatny")
else
    disp("model nieje dobry");
end