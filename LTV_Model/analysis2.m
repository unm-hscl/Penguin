Ts = .5;
N = 100; 
nTrials = 10;
avgErr = 0;

for t = 2:96
    
    [A, B] = getStateMatrices(t, Ts);
    M = 5;
    a = -1;
    b =  1;
    X0 = a + (b-a)*rand(2, M);
    WindowWidth = 5;
    WindowStart = t - floor(WindowWidth/2);
    err = 0; 
    for p = 1:nTrials
    
        [X, U, Y] = generateSamples_Traj(X0, N, Ts);
        Xs = double.empty();
        Us = double.empty();
        Ys = double.empty();
        for p = 1:M
            Xs = [Xs, X(:, p + WindowStart*M:M:p + (WindowStart + WindowWidth)*M)];
            Us = [Us, U(:, p + WindowStart*M:M:p + (WindowStart + WindowWidth)*M)];
            Ys = [Ys, Y(:, p + WindowStart*M:M:p + (WindowStart + WindowWidth)*M)];
        end
        [Abar, Bbar] = RKHS_Approximation(Xs, Us, Ys)
        err = err + norm([A B] - [Abar Bbar], 'fro') % Frobenius norm
        % err = err + max(max(abs([A B] - [Abar Bbar])));
        end
    
    avgErr = avgErr + err/nTrials;
    
end
FinalAvgErr = avgErr/length(2:96)