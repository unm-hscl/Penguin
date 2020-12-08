function U = controlPolicy(X)
%CONTROLPOLICY Computes the control action based on the state.

% Since we don't have a good control law for this, we're just going to use
% random numbers. We could just as easily use 0, but this will make it so
% we can't find B.
% 
% Don't use this: U = zeros(1, size(X, 2));

% U = randn(1, size(X, 2));

U = ones(1, size(X, 2));

end

