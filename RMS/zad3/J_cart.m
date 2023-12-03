function J = J_cart(theta,u,x,t)
%J_CART Summary of this function goes here
%   Detailed explanation goes here
   K_v = theta(1);
   T_v = theta(2);
   F = tf(K_v,[T_v 1 0]);
   x_hat = lsim(F,u,t);
   e = x - x_hat;
   J = e'*e;
end

