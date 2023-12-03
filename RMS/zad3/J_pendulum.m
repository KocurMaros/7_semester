function J = J_pendulum(theta,x,phi,t)
%J_CART Summary of this function goes here
%   Detailed explanation goes here
   K_k = theta(1);
   omega_0 = theta(2);
   b = theta(3);
   F = tf([K_k*omega_0^2 0 0],[1 2*b*omega_0 omega_0^2]);
   phi_hat = lsim(F,x,t);
   e = phi - phi_hat;
   J = e'*e;
end

