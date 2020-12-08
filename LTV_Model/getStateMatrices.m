function [A, B] = getStateMatrices(t, Ts)
% GETSTATEMATRICES Returns the state matrices for a spring mass-damper
% system with a sinusoidal time-varying damping coefficient.
% 
%   Usage: 
%       [A, B] = GETSTATEMATRICES(t) 
%       Gets the matrices at a particular time.
% 
%       [A, B] = GETSTATEMATRICES(t, Ts)
%       Gets the matrices at a particular time with sampling rate Ts. 
%   

p = inputParser;
addRequired(p, 't');
addOptional(p, 'Ts', 0.1);
parse(p, t, Ts);

Ts = p.Results.Ts;

% Constants.

m = 1;
k = 1 + sin(t); % <-- Sinusoidal time-varying damping coefficient.
b = 0.2;

% Continuous state matrices.

A = [0 1; -k/m -b/m];
B = [0 1/m]';
C = [1 0];
D = [0];

% Convert to discrete time system using a ZOH method.

sys = ss(A, B, C, D);
dsys = c2d(sys, Ts);

% Return the state and control matrices.

A = dsys.A;
B = dsys.B;

end
