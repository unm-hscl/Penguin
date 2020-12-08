%Frequency Analysis Attempts

%%

signal = Novice01_error_TimeScaled(:,1);
N = length(signal);
fs = 1/.034; % 62.5 samples per second
fnyquist = fs/2; %Nyquist frequency


subplot(2,2,1)
plot(signal);
title ('Novice01 X Error (Difference between Optimal Trajectory and Raw Trajectory)')
xlabel("Samples");
ylabel("Pixels");

subplot(2,2,2)
X_mags = abs(fft(signal));
bin_vals = [0 : N-1];
fax_Hz = bin_vals*fs/N;
N_2 = ceil(N/2);
plot(fax_Hz(1:N_2), X_mags(1:N_2))
xlabel('Frequency (Hz)')
ylabel('Magnitude');
title('Single-sided Magnitude spectrum (Hertz)');


subplot(2,2,3)
plot(fax_Hz(1:N_2), X_mags(1:N_2))
xlim([0 2])
xlabel('Frequency (Hz)')
ylabel('Magnitude');
title('Single-sided Magnitude spectrum (Hertz) Zoomed in from 0 to 1 Hertz');

%% Frequency-Domain Plot of Expert01_Trajectory X Coordinates.
%signal = Expert01_Trajectory(:,1);
% signal = Novice01_error_TimeScaled(:,1);
% Fs = (1/0.034);                                 % Sampling Frequency (Hz)
% Fn = Fs/2;                                      % Nyquist Frequency (Hz)
% L = length(signal);                             % ‘signal’ Is A Vector
% xm = mean(signal);
% xfft = fft(signal - xm)/L;                      % Subtract Mean & Normaloise By ‘L’
% Fv = linspace(0, 1, fix(L/2)+1)*Fn;             % Frequency Vector
% Iv = 1:numel(Fv);                               % Index Vector
% figure
% plot(Fv, abs(xfft(Iv))*2)
% grid
% xlabel('Frequency (Hz)')
% ylabel('Magnitude')
% title ('Single-sided Spectral Density of Novice01 Error Trajectory (X Coordinate)');