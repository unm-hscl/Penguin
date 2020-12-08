function z = penguin_state_function(x, u)

V = 5;

z = zeros(2,1);
z(1) = V*cos(u(1));
z(2) = V*sin(u(1));

end
