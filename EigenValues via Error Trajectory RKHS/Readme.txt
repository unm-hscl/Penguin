This readme is applicable to the folder EigenValues via Error Trajectory.

This folder allows one to view the eigenvalues from an error trajectory.
The error trajectory is the difference betwee a nonlinear optimal

Part 1 - nonlinear_optim_problem.m
The folder EigenValues via Error Trajectory/Optimal Solution/nonlinear_optim_problem_Pt1.m provides a nonlinear optimal solution
given a raw data input which is based on an expert.

Part 2 - RKHS_ScalingTime_ErrorTrajectory_pt2.m
This script scales the expert to novice time horizon via interpolation. It also inputs that error trajectory into RKHS
and calculates the eigenvalues and 2-norm of those eigenvalues.

Part 3 - Plots_of_Error_Trajectories_EigenValues_pt3.m
This script takes the output from Part 2 and just plots them altogether.

There is also a Penguin Completion Times.xlsx spreadsheet that has the interpolation scaling factor(s) needed to compute
