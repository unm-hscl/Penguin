%% RKHS Analysis
clc
% So we need to compare the state matrices we get from the RKHS to the
% actual state/control matrices. To do that, we can generate the actual state
% matrices at any given time step since we know the dynamics. But then we
% need to form an RKHS approximation of A and B using samples. Since the
% RKHS uses samples, we generate some trajectories over the whole time
% horizon and then we select only the samples over a short window, giving
% us a "local" approximation. Then we use those samples from the
% trajectories over a short window to generate the approximations of A and B.

rng(0)

% We first specify a sampling time Ts.

Ts = 5;

% Now we specify a time horizon. How long should the trajectories go for?

N = 100; % Remember that this is time steps, not seconds, so 100*Ts seconds.

% Now remember that this is an LTV (linear time-varying) system, which
% means A and B change with time. 
% 
% So we can then get the actual state matrices at a particular time using:

avgErr = 0;

nTrials = 10;

for t = 40:59 
% t can't be greater than the N. 
% For example, t = 5 means at 5*Ts seconds.

[A, B] = getStateMatrices(t, Ts)

% Now, we generate some samples to build the approximation of the state and
% control matrices. We're just going to use random values here to set the
% initial conditions.

M = 5; % Number of trajectories.

% This is just a fancy way of changing the bounds to [a, b]
a = -1;
b =  1;
X0 = a + (b-a)*rand(2, M);

[X, U, Y] = generateSamples_Traj(X0, N, Ts);

% So the code I drew up generates the samples so that there will be N*M
% samples in the X vector, and they are ordered such that: 
%   Trajectory 1 = all rows, columns 1:M:end
%   Trajectory 2 = all rows, columns 2:M:end
%   etc.
% 
% So if we want to reduce the window, we choose a shorter end time.
% We can think of the window like this:
% 
%                       <-------Window------>
% |--------------------|----------|----------|------------------------------|
% 0                WindowStart    t     t+WindowWidth                       N

WindowWidth = 80;
WindowStart = t - floor(WindowWidth/2); % This centers the window on t. 


% So for a specific start time, we need to multiply the time by M to get 
% to the right index.

% e.g. to get trajecotry 1: 
% 
% X_traj1 = X(:, 1 + WindowStart*M:M:1 + (WindowStart + WindowWidth)*M);
% 
% So to get all trajectories, we need a for loop.

Xs = double.empty();
Us = double.empty();
Ys = double.empty();

for p = 1:M
    
    Xs = [Xs, X(:, p + WindowStart*M:M:p + (WindowStart + WindowWidth)*M)];
    Us = [Us, U(:, p + WindowStart*M:M:p + (WindowStart + WindowWidth)*M)];
    Ys = [Ys, Y(:, p + WindowStart*M:M:p + (WindowStart + WindowWidth)*M)];
    
end

% Now we can compute an approximation of the A, B matrices. 

[Abar, Bbar] = RKHS_Approximation(Xs, Us, Ys)

% Compute Frobenius Norm

err = norm(A - Abar, 'fro') % Frobenius norm
avgErr = avgErr + err;
end

FinalAvgErr = avgErr/length(40:59)

%% Notes from talk with Adam

% err = max(max(abs(A - Abar)))
% avgErr = 0;
%for t = 10:90
%   err = norm(A - Abar, 'fro') % Frobenius norm
%   avgErr = avgErr + err;
%end
% FinalAvgErr = avgErr/length(10:90)

% We want to check for values in this range:
% Approximately.
% 
% Ts = [0.1, 0.200, 0.400, 0.5];
% t = 10:90;
% WindowWidth = [5, 10, 15, 20];
% 
% If Ts = 0.1, then WindowWidth = 5 means WindowWidth = 0.5 s
% If Ts = 0.5, then WindowWidth = 5 means WindowWidth = 2.5 s

% Take average error over all t for given (Ts, WindowWidth)

% What we want from this:
% 
% 1. Average error as a plot (surface plot) that is a function of Ts & WindowWidth
% 
% 2. Error at 3 particular time steps as a function of Ts & WindowWidth
% 
% Could do:
% 
%      | Ts1 | Ts2 | Ts3 ....
% -----+-----+-----+-----
%  WW1 | err
%  WW2 |
%  WW3 |