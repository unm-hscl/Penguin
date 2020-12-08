%% Part 2 
%  Scales expert to novice time horizon via interpolation. It also 
%  inputs that error trajectory into RKHS and calculates the eigenvalues
%  and 2-norm of those eigenvalues.
%  Requires: nonlinear_optim_problem_Pt1 script to be ran first. & Novice01_Trajectory.mat 
%  Product: Novice01_error_TimeScaled.mat & Novice01_Log_30DSF (Downsample factor


clc 
%% Prelim
[ExpNumRows,ExpNumCols] = size(Expert01_Trajectory);
[NovNumRows,NovNumCols] = size(Novice01_Trajectory);

%% Scaling Expert to Novice Time Horizon. 

Novice01_XPosition = Novice01_Trajectory (:,1);
Novice01_YPosition = Novice01_Trajectory (:,2);
Novice01_U = Novice01_Trajectory (:,8);

TempRadians_U = rad2deg(sol.u);

Expert01TimeScaled_X = interp1(sol.x, 1:.87:ExpNumRows); %Refer to Penguin Completion Times.xlsx for time ratios
Expert01TimeScaled_Y = interp1(sol.y, 1:.87:ExpNumRows);
Expert01TimeScaled_U = interp1(TempRadians_U, 1:.87:ExpNumRows);

Expert01TimeScaled_X_T = transpose(Expert01TimeScaled_X);
Expert01TimeScaled_Y_T = transpose(Expert01TimeScaled_Y);
Expert01TimeScaled_U_T = transpose(Expert01TimeScaled_U);

error_TimeScaled_X = Expert01TimeScaled_X_T - Novice01_XPosition;
error_TimeScaled_Y = Expert01TimeScaled_Y_T - Novice01_YPosition;
error_TimeScaled_U = Expert01TimeScaled_U_T - Novice01_U;

FeedmeintoRKHS_Trajectory = [error_TimeScaled_X, error_TimeScaled_Y, error_TimeScaled_U];

Novice01_error_TimeScaled = [error_TimeScaled_X, error_TimeScaled_Y]; %Manually save this to input into
                                                                      %Plots_of_Error_Trajectories_pt3

%% Penguin Analysis
clc
N = 5; %Number of Samples
d = 3;  %Dimensionality of the system
C = eye(3);
D = 0;
%h = figure;
Novice01_Norm = [];
EigenValuesTemp = [];
%filename = 'RKHS_ScalingTime_ErrorTrajectory_5S.gif';
 
%% DownSampling % Change downsample factor to preferred time
%Downsample factor of 9 --> 9 * .034s = .306s
%Downsample factor of 15 --> 15 * .034s = .510s
%Downsample factor of 30 --> 30 * .034s = 1.02s

downsamplefactor = 9;
DownsampledFeedmeintoRKHS_Traj = downsample(FeedmeintoRKHS_Trajectory, downsamplefactor);

%% Interpolation- same # of samples across all downsampled trajectories

%InterpDownsampledFeedmeintoRKHS_Traj  = interp1(DownsampledFeedmeintoRKHS_Traj, 0:);           %shortest downsampled trajectory

%% Regression of  A and B Matrix with Disturbance
%Column [1 2 3] refers to x position, y position and theta respectively
for k =0:100
    X = InterpDownsampledFeedmeintoRKHS_Traj(k+1:k+5,[1 2 3])';
    U = InterpDownsampledFeedmeintoRKHS_Traj(k+1:k+5,3)';
    Y = InterpDownsampledFeedmeintoRKHS_Traj(k+2:k+6,[1 2 3])';
    S = [X; U; ones(1, N)];
    Hbar = (Y*S.')/((1E-5)*N*eye(size(S, 1)) + S*S.'); %Total Block Matrix includes A,B and the mean of my disturbance
    Abar = Hbar(1:d, 1:d);
    Bbar = Hbar(1:d, d+1);
    
    %Calculates the 3 eigenValues
    EigenValues = eig(Abar);
    EigenValuesTemp = [EigenValuesTemp; EigenValues];
    
    %Takes the 2norm of those eigenValues.
    NormTemp = norm(EigenValues);
    Novice01_Norm = [Novice01_Norm ;  NormTemp];
    
    %Takes the log base 10 of the 2norm of those eigenvalues
    Novice01_Log_9DSF = log10(Novice01_Norm); %Manually save this to input into
                                               %Plots_of_Error_Trajectories_pt3
end

