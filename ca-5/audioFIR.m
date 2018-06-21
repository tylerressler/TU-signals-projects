function myFIRaudio = audioFIR(d,a,file)
% Used to create FIR filter to produce echo in audio clips
% d = time between audio signal & first echo
% a = scale factor of echo
% file = audio file used

% define sampling frequency
fs  = 44100;

% FIR filter creation
b = [1 zeros(1,d*fs) a];    % filter

% audio signal with echo
myFIRaudio = filter(b,1,file);   % creates FIR-echo