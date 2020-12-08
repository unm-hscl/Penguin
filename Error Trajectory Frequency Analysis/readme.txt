The folder \Error Trajectory Frequency Analysis provides a frequency analysis of the Error Trajectory
This error trajectory is taken from the non linear optimal based on a raw Expert trajectory.
It is then scaled to a novice length and the difference is then calculated.

Part 1 - nonlinear_optim_problem_Pt1.m

This script calculates the non linear optimal solution in terms of sol.x, sol.y and sol.u. These are needed for 
RKHS_ScalingTimePrep_Pt2.m

Part 2 - RKHS_ScalingTimePrep_Pt2.m

This specific script does two things. The first is that it scales the expert to novice time horizon via interpolation
It then applies RKHS with an option to downsample the data.

Part 3 - Basic_Error_Trajectory_Freq_Analysis.m & Basic_Error_Trajectory_Freq_Analysis_Comparison

This script (Basic_Error_Trajectory_Freq_Analysis.m) provides the single-sided magnitude spectrum (Frequency vs Magnitude).

This script (Basic_Error_Trajectory_Freq_Analysis_Comparison) provides a comparison of the single-sided magnitude spectrum
between all the novices 01-05. 




