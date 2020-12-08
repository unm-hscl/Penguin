%% Provides Novice01-05 X Error Frequency Analysis Attempts

%% Novice01

signal_novice01 = Novice01_error_TimeScaled(:,1);
N1 = length(signal_novice01);
fs1 = 1/.034; % 62.5 samples per second
fnyquist1 = fs1/2; %Nyquist frequency

subplot(2,3,1)
X_mags1 = abs(fft(signal_novice01));
bin_vals1 = [0 : N1-1];
fax_Hz1 = bin_vals1*fs1/N1;
N_21 = ceil(N1/2);
plot(fax_Hz1(1:N_21), X_mags1(1:N_21))
xlim([0 2])
xlabel('Frequency (Hz)')
ylabel('Magnitude');
title('Novice 01 X Error Single-sided Magnitude spectrum (Hertz)');
hold on

%% Novice02

signal_novice02 = Novice02_error_TimeScaled(:,1);
N2 = length(signal_novice02);
fs2 = 1/.034; % 62.5 samples per second
fnyquist2 = fs2/2; %Nyquist frequency

subplot(2,3,2)
X_mags2 = abs(fft(signal_novice02));
bin_vals2 = [0 : N2-1];
fax_Hz2 = bin_vals2*fs2/N2;
N_22 = ceil(N2/2);
plot(fax_Hz2(1:N_22), X_mags2(1:N_22))
xlim([0 2])
xlabel('Frequency (Hz)')
ylabel('Magnitude');
title('Novice02 X Error Single-sided Magnitude spectrum (Hertz)');
hold on

%% Novice03
signal_novice03 = Novice03_error_TimeScaled(:,1);
N3 = length(signal_novice03);
fs3 = 1/.034; % 62.5 samples per second
fnyquist3 = fs3/2; %Nyquist frequency

subplot(2,3,3)
X_mags3 = abs(fft(signal_novice03));
bin_vals3 = [0 : N2-1];
fax_Hz3 = bin_vals3*fs3/N3;
N_23 = ceil(N3/2);
plot(fax_Hz3(1:N_23), X_mags2(1:N_23))
xlim([0 2])
xlabel('Frequency (Hz)')
ylabel('Magnitude');
title('Novice03 X Error Single-sided Magnitude spectrum (Hertz)');
hold on


%% Novice04
signal_novice04 = Novice04_error_TimeScaled(:,1);
N4 = length(signal_novice04);
fs4 = 1/.034; % 62.5 samples per second
fnyquist4 = fs4/2; %Nyquist frequency

subplot(2,3,4)
X_mags4 = abs(fft(signal_novice04));
bin_vals4 = [0 : N4-1];
fax_Hz4 = bin_vals4*fs4/N4;
N_24 = ceil(N4/2);
plot(fax_Hz4(1:N_24), X_mags4(1:N_24))
xlim([0 2])
xlabel('Frequency (Hz)')
ylabel('Magnitude');
title('Novice04 X Error Single-sided Magnitude spectrum (Hertz)');
hold on

%% Novice05
signal_novice05 = Novice05_error_TimeScaled(:,1);
N5 = length(signal_novice05);
fs5 = 1/.034; % 62.5 samples per second
fnyquist5 = fs5/2; %Nyquist frequency

subplot(2,3,5)
X_mags5 = abs(fft(signal_novice05));
bin_vals5 = [0 : N5-1];
fax_Hz5 = bin_vals5*fs5/N5;
N_25 = ceil(N5/2);
plot(fax_Hz5(1:N_25), X_mags2(1:N_25))
xlim([0 2])
xlabel('Frequency (Hz)')
ylabel('Magnitude');
title('Novice05 X Error Single-sided Magnitude spectrum (Hertz)');
hold on

%% Frequency-Domain Plot of Expert01_Trajectory X Coordinates.
% signal = Expert01_Trajectory(:,1);
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
% title ('Single-sided Spectral Density of Novice01 Error Trajectory (X Coordinate)');req Analysis Comparison