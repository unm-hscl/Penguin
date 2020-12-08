function [Abar, Bbar] = RKHS_Approximation(X, U, Y)
%RKHS_APPROXIMATION Generates an approximation of the state and control
% matrices using samples. 
% 
%   Usage:
%       [Abar, Bbar] = RKHS_APPROXIMATION(X, U, Y)
%       Where X are the state samples, U are the input samples, and Y are
%       the output samples.

d = size(X, 1);
M = size(X, 2);

S = [X; U; ones(1, M)];
Hbar = (Y*S.')/((1E-5)*M*eye(size(S, 1)) + S*S.');

Abar = Hbar(1:d, 1:d);
Bbar = Hbar(1:d, d+1);

end

