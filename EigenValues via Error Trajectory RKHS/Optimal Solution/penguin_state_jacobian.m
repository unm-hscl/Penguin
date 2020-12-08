function [A, Bmv] = penguin_state_jacobian(x, u)

V = 5;

A = zeros(2);

Bmv = zeros(2, 1);

Bmv(1) = -5*sin(u(1));
Bmv(2) = 5*cos(u(1));

end