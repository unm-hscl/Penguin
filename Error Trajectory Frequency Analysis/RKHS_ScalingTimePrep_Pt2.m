%% Part 2 
%  Scales expert to novice time horizon via interpolation. 
%  Requires: nonlinear_optim_problem_Pt1 script to be ran first. & Novice01_Trajectory.mat 


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

Novice01_error_TimeScaled = [error_TimeScaled_X, error_TimeScaled_Y]; 

%% Penguin Analysis
clc
N = 5; %Number of Samples
d = 3;  %Dimensionality of the system
C = eye(3);
D = 0;
%h = figure;
%Novice01_Norm = [];
%EigenValuesTemp = [];


%filename = 'RKHS_ScalingTime_ErrorTrajectory_5S.gif';
 
%% Interpolate to achieve a 'downsampled' ratio similiar to that below.
%Downsample factor of 9 --> 9 samples * .034s = .306s
%Downsample factor of 15 --> 15 samples * .034s = .510s
%Downsample factor of 30 --> 30 samples * .034s = 1.02s

%Select proper DSF (Downsample Factor)
DSF = 9;

Novice01_DownsampledFeedmeintoRKHS_Traj = interp1(FeedmeintoRKHS_Trajectory, 1:DSF:NovNumRows);


%% Regression of  A and B Matrix with Disturbance
%Column [1 2 3] refers to x position, y position and theta respectively
for k =0:100
    X = Novice01_DownsampledFeedmeintoRKHS_Traj(k+1:k+5,[1 2 3])';
    U = Novice01_DownsampledFeedmeintoRKHS_Traj(k+1:k+5,3)';
    Y = Novice01_DownsampledFeedmeintoRKHS_Traj(k+2:k+6,[1 2 3])'; 
    S = [X; U; ones(1, N)];
    Hbar = (Y*S.')/((1E-5)*N*eye(size(S, 1)) + S*S.'); %Total Block Matrix includes A,B and the mean of my disturbance
    Abar = Hbar(1:d, 1:d);
    Bbar = Hbar(1:d, d+1)
end