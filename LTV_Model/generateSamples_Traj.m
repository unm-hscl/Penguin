function [X, U, Y] = generateSamples_Traj(X0, N, Ts)
%GENERATESAMPLES_TRAJ Generate samples that are trajectory rollouts.
% 
%   Usage:
%       [X, U, Y] = GENERATESAMPLES_TRAJ(X0, N, Ts)
% 
%       Generates samples via trajectories, where N is the number of time
%       steps, Ts is the sample time, X0 are the initial conditions, 
%       in cloumn form.
% 
%       [      |      |      |     ]
%       [ x0_1 | x0_2 | x0_3 | ... ]
%       [      |      |      |     ]

p = inputParser;
addRequired(p, 'X0');
addRequired(p, 'N');
addOptional(p, 'Ts', 0.1);
parse(p, X0, N, Ts);
Ts = p.Results.Ts;

X_temp = X0;
Y_temp = zeros(size(X_temp));

X = double.empty();
U = double.empty();
Y = double.empty();

for k = 1:N
    
    [A, B] = getStateMatrices(k, Ts);
    
    U_temp = controlPolicy(X_temp);
    
    Y_temp = A*X_temp + B*U_temp + 0.01*randn(size(X_temp));
    
    X = [X, X_temp];
    U = [U, U_temp];
    Y = [Y, Y_temp];
    
    X_temp = Y_temp;
    
end


end

