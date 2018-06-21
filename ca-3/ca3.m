% Comuter Assignment 3
% Tyler Ressler 
% ECE 3512 - 001
%-------------------------------------------------------------------------

clear; 
clf;

% load data from file
filename = 'ca3_AM_Data.mat';
load(filename);

% set graph defaults
 set(0,'DefaultTextFontName','Times',...
'DefaultTextFontSize',18,...
'DefaultAxesFontNam','Times',...
'DefaultAxesFontSize',18,...
'DefaultLineLineWidth',1,...
'DefaultLineMarkerSize',7.75);

% plot modulated signal combination
figure(1); 
t = linspace(0,length(xmod)/fs, length(xmod));  % time vector [s]
plot(t, xmod);                                  % plot initial signal
xlabel('Time [s]');
title('AM Modulated Test Signal');

% plot FT of test signal
figure(2);
myFFT(xmod, fs);                                % FT of data to determine modulation freqs
xlabel('Frequency [Hz]');
ylabel('Amplitude');
title('Fourier Transform of Test Signal');

% individual test signal components
% [xmodFT, f] = myFFT(xmod, fs);
% 
% 
% xlims1 = 3.3e4:3.7e4;                             % freq range for first modulated signal
% xlims2 = 5.2e4:5.8e4;                             % freq range for second modulated signal
% xlims3 = 7e4:9e4;                                 % freq range for third modulated signal
% 
% xmodFT1 = xmodFT(xlims1);                         % freq components for first mod signal
% xmodFT2 = xmodFT(xlims2);                         % freq components for second mod signal
% xmodFT3 = xmodFT(xlims3);                         % freq components for third mod signal
% 
% figure(3);
% plot(f(xlims1),xmodFT1);
% xlabel('Frequency [Hz]');
% ylabel('Amplitude');

fs2 = 44.1e3;
% FIRST SIGNAL DEMODULATION

fcos1 = 3.4975e4;                                   % freq [Hz] of first sig modulation
wcos1 = 2*pi*fcos1;                                 % freq [rads/s]
cos1 = cos(wcos1*t);                                % cos at carrier frequency

% multiply modulated signal by carrier freq
demod1 = cos1.*xmod; 
xr = resample( demod1 , fs2 , fs );
%soundsc(xr, fs2);

figure(3);
subplot(2,1,1);
myFFT(xr, fs/2/pi);                                  % test result of multiplication


%determine transfer function
order = 10;
fc = 5e3;                                           % cutoff freq [Hz]
[b,a] = butter( order , 2*pi*fc , 's' );            % create low pass butter filter
H = tf(b,a);                                        % define transfer function of butter filter

% return input signal 1
x = lsim(H, demod1, t);
x = resample(x, fs2, fs);
subplot(2,1,2);
myFFT(x, fs/2/pi);

%soundsc(x, fs2);

% plot unfiltered signal vs. filtered signal
figure(4);
t2 = linspace(0, length(x)/fs2, length(x));
subplot(2,1,1)
plot(t2, abs(xr))
xlabel('Time [s]');
ylabel('Amplitude');
title('Unfiltered Demodulated Signal Component 1');
subplot(2,1,2)
plot(t2, abs(x))
xlabel('Time [s]');
ylabel('Amplitutde');
title('10th Order Butterworth Filter on Demodulated Signal Component 1');

%--------------------------------------------------------------------------
%% FM Demodulation
filename = 'ca3_FM_Data.mat';
load(filename);

% % Attempt 1
xder = diff(xmod);          % derivative of FM signal
xfm = envelope(xder);       % apply envelope detector

fs = 384000;                % define sampling freq
fs2 = 44.1e3;               % define sampling frequency
xfm = resample(xfm, fs2, fs); % resample data to 44.1e3 sampling freq
xfm = xfm .* cos(5e4*2*pi);
xfm(1:100) = [];
xfm(end-100: end) = [];

figure(5);
tfm = linspace(0, length(xfm)/fs2, length(xfm));
plot(tfm, xfm);
xlabel('Time [s]');
ylabel('Amplitude');
title('FM Demodulation Using Derivative & Envelope')

soundsc(xfm, fs2);


% Attempt 2 using fmdemod
thresh = 1;
[x, f] = myFFT(xmod, fs);      % determine carrier freq using fft
[peakVal,peakLoc]= findpeaks(abs(x),'minpeakheight',thresh);
freqsSort = sort(f(peakLoc));

%fs = 44.1e3;                   % sampling frequency (must be 2*fs)
fc = freqsSort(2);              % carrier frequency
freqdev = 500e3/fc;             % ratio of max dev freq to max carrier freq

z = fmdemod(xmod,fc,fs,freqdev); 

fs2 = 44.1e3;                   % define sample freq
zfm = resample(z, fs2, fs);

% plot settings
figure(6);
tfm = linspace(0, length(zfm)/fs2, length(zfm));
plot(tfm, zfm);
ylim([-20 20]);
xlabel('Time [s]');
ylabel('Amplitutde');
title('FM Demodulation Using fmdemod')

% play sound
%soundsc(zfm, fs2);


