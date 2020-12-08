% %% Part 3 
% % Plots the 2-norm of Eigenvalues from error trajectories
% % and plots the error trajectories between optimal Expert01 (sol.x,
% % sol.y) & Novice01 (Time Scaled).
% 
% %% Calculates 2-Norm of Error Trajectories.
% 
% %Novice01 2-Norm of Error (log)
% Novice01_squared = Novice01_error_TimeScaled.^2;
% Novice01_sum = [Novice01_squared(:,1) + Novice01_squared(:,2)];
% Novice01error_2norm = sqrt(Novice01_sum);
% Novice01error_2normlogbase = log10(Novice01error_2norm);
% 
% %Novice02 2-Norm of Error (log)
% Novice02_squared = Novice02_error_TimeScaled.^2;
% Novice02_sum = [Novice02_squared(:,1) + Novice02_squared(:,2)];
% Novice02error_2norm = sqrt(Novice02_sum);
% Novice02error_2normlogbase = log10(Novice02error_2norm);
% 
% %Novice03 2-Norm of Error (log)
% Novice03_squared = Novice03_error_TimeScaled.^2;
% Novice03_sum = [Novice03_squared(:,1) + Novice03_squared(:,2)];
% Novice03error_2norm = sqrt(Novice03_sum);
% Novice03error_2normlogbase = log10(Novice03error_2norm);
% 
% %Novice04 2-Norm of Error (log)
% Novice04_squared = Novice04_error_TimeScaled.^2;
% Novice04_sum = [Novice04_squared(:,1) + Novice04_squared(:,2)];
% Novice04error_2norm = sqrt(Novice04_sum);
% Novice04error_2normlogbase = log10(Novice04error_2norm);
% 
% %Novice05 2-Norm of Error (log)
% Novice05_squared = Novice05_error_TimeScaled.^2;
% Novice05_sum = [Novice05_squared(:,1) + Novice05_squared(:,2)];
% Novice05error_2norm = sqrt(Novice05_sum);
% Novice05error_2normlogbase = log10(Novice05error_2norm);
% 
% 
% clc
% %% Error Trajectory of 2 Norm
% %Novice01 - 2Norm
% subplot(4,1,1)
% time2norm1 = linspace(0, 18.821, 555);
% plot(time2norm1, Novice01error_2norm);
% hold on;
% 
% %Novice02 - 2Norm
% time2norm2 = linspace(0, 19.165, 566);
% plot(time2norm2, Novice02error_2norm);
% hold on
% 
% %Novice03 - 2Norm
% time2norm3 = linspace(0, 18.649, 551);
% plot(time2norm3, Novice03error_2norm);
% hold on
% 
% %Novice04 - 2Norm
% time2norm4 = linspace(0, 18.212, 537);
% plot(time2norm4, Novice04error_2norm);
% hold on
% 
% %Novice05 - 2Norm
% time2norm5 = linspace(0, 18.78, 553);
% plot(time2norm5, Novice05error_2norm);
% yline(1)
% yline(0)
% title('Error Trajectory of Non-Linear Optimal Expert01 vs Time Scaled Novices01-05 (2-Norm)');
% xlabel('Time(s)');
% ylabel('2-Norm of Error');
% legend('Novice01', 'Novice02', 'Novice03', 'Novice04', 'Novice05');
% hold off
% %% Plots 2-Norm of Eigenvalues (Log Base 10) based on downsamplefactor = 9
% subplot(4,1,2)
% 
% %Novice01 - 2Norm - 9 DSF
% 
% time2norm1 = linspace(0, 18.821, 57);
% plot(time2norm1, Novice01_Log_9DSF);
% hold on;
% 
% %Novice02 - 2Norm  - 9 DSF
% time2norm2 = linspace(0, 19.165, 58);
% plot(time2norm2, Novice02_Log_9DSF);
% hold on
% 
% %Novice03 - 2Norm    - 9 DSF
% time2norm3 = linspace(0, 18.649, 57);
% plot(time2norm3, Novice03_Log_9DSF);
% hold on
% 
% %Novice04 - 2Norm  - 9 DSF
% time2norm4 = linspace(0, 18.212, 55);
% plot(time2norm4, Novice04_Log_9DSF);
% hold on
% 
% %Novice05 - 2Norm   - 9 DSF
% time2norm5 = linspace(0, 18.78, 57);
% plot(time2norm5, Novice05_Log_9DSF);
% yline(1)
% yline(0)
% title('2-Norm (Log Base 10) of EigenValues Based on Error Trajectory');
% xlabel('Time(s)');
% ylabel('2-Norm');
% legend('Novice01', 'Novice02', 'Novice03', 'Novice04', 'Novice05');
% hold off
% %% Plots 2-Norm of Eigenvalues (Log Base 10) based on downsamplefactor = 15
% subplot(4,1,3)
% 
% %Novice01 - 2Norm - 15 DSF
% 
% time2norm1 = linspace(0, 18.821, 32);
% plot(time2norm1, Novice01_Log_15DSF);
% hold on;
% 
% %Novice02 - 2Norm - 15 DSF
% time2norm2 = linspace(0, 19.165, 33);
% plot(time2norm2, Novice02_Log_15DSF);
% hold on
% 
% %Novice03 - 2Norm - 15 DSF
% time2norm3 = linspace(0, 18.649, 32);
% plot(time2norm3, Novice03_Log_15DSF);
% hold on
% 
% %Novice04 - 2Norm - 15 DSF
% time2norm4 = linspace(0, 18.212, 31);
% plot(time2norm4, Novice04_Log_15DSF);
% hold on
% 
% %Novice05 - 2Norm - 15 DSF
% time2norm5 = linspace(0, 18.78, 32);
% plot(time2norm5, Novice05_Log_15DSF);
% yline(1)
% yline(0)
% title('2-Norm (Log Base 10) of EigenValues Based on Error Trajectory');
% xlabel('Time(s)');
% ylabel('2-Norm');
% legend('Novice01', 'Novice02', 'Novice03', 'Novice04', 'Novice05');
% hold off
% %% Plots 2-Norm of Eigenvalues (Log Base 10) based on downsamplefactor = 30
% subplot(4,1,4);
% 
% %Novice01 - 2Norm 30 DSF
% 
% time2norm1 = linspace(0, 18.821, 14);
% plot(time2norm1, Novice01_Log_30DSF);
% hold on;
% 
% %Novice02 - 2Norm 30 DSF
% time2norm2 = linspace(0, 19.165, 14);
% plot(time2norm2, Novice02_Log_30DSF);
% hold on
% 
% %Novice03 - 2Norm 30 DSF
% time2norm3 = linspace(0, 18.649, 14);
% plot(time2norm3, Novice03_Log_30DSF);
% hold on
% 
% %Novice04 - 2Norm 30 DSF
% time2norm4 = linspace(0, 18.212, 13);
% plot(time2norm4, Novice04_Log_30DSF);
% hold on
% 
% %Novice05 - 2Norm 30 DSF
% time2norm5 = linspace(0, 18.78, 14);
% plot(time2norm5, Novice05_Log_30DSF);
% yline(1)
% yline(0)
% title('2-Norm (Log Base 10) of EigenValues Based on Error Trajectory');
% xlabel('Time(s)');
% ylabel('2-Norm');
% legend('Novice01', 'Novice02', 'Novice03', 'Novice04', 'Novice05');
% 
% hold off

%% Sanity Checks

figure()
hold on
plot(FeedmeintoRKHS_Trajectory (:,1), FeedmeintoRKHS_Trajectory (:,2));
plot(DownsampledFeedmeintoRKHS_Traj (:,1), DownsampledFeedmeintoRKHS_Traj(:,2), '-o')
%plot(InterpDownsampledFeedmeintoRKHS_Traj (:,1), InterpDownsampledFeedmeintoRKHS_Traj(:,2), '-o')
legend ('Raw Error Trajectory', 'Downsampled Error Trajectory');
hold off