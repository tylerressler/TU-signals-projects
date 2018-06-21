%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Author: Tyler Ressler
% Date Created: December 10, 2017
% Course: Signals (ECE 3512), Temple University - Fall 2017
% Computer Assignment 05
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%   After another crisis it is getting obvious why the spoon is used according to the design. 
%   However, we use it as a musical instrument.


% To plot results or to play sound, uncomment code in desired section

clc;

load('hw5Data');

% plot beep
%figure(1);set(gcf,'name','Beep Plot','numbertitle','off');
%plot(t_beep, beep);

% play beep
%soundsc(beep,fs);

%--------------------------------------------------------------------------

% create FIR-echo
% d = 0.1;                    % echo d seconds later
% a = 1;                      % scaling factor of echo
% b = [1 zeros(1,d*fs) a];    % filter
% 
% myFIRbeep = filter(b,1,beep);   % creates FIR-echo

% plot my FIR-echo beep
%figure(2);set(gcf,'name','My FIR Beep Plot','numbertitle','off');
%plot(t_beep, myFIRbeep);

% play my beep
%soundsc(myFIRbeep, fs);

%--------------------------------------------------------------------------

% % create IIR-echo

% d = 0.20;                     % echo d seconds later
% b = 1;                        
% m = 2;                        % scaling factor introduced to a
% a = [1 zeros(1,d*fs) m*a];    % filter
% 
% myIIRbeep = filter(b,a,beep);   % creates-IIR echo

% plot my IIR-echo beep
%figure(3);set(gcf,'name','My IIR Beep Plot','numbertitle','off');
%plot(t_beep, myIIRbeep);

% play my IIR-echo beep
%soundsc(myIIRbeep, fs);

%--------------------------------------------------------------------------

% create echo sound effects in audio clips - uncomment desired audio clip

% file selecton
%audio = audio1;
%audio = audio2; 

% attempt to use FIR 
%audioFIR(1,1,audio);

% attempt to use IIR-echo on audio1
% d = 1;                      
% m = 1;                      
% a = [1 zeros(1,d*fs) m*a];
% 
% myIIRaudio = conv(a,audio,'full');   

% define output data to test
%output_data = audioFIR;
%output_data = audioIIR;

% play final audio signal
%soundsc(output_data, fs);
%--------------------------------------------------------------------------

% create stereo audio effect

% file selection
%audio = audio1;
audio = audio2;

% filter for audio


% stereo audio output with FIR
% sig_out(:, 1) = audio;
% sig_out(:, 2) = audioFIR(.2,0.5,audio);


% stereo audio output with IIR

% d = 0.02;                      
% m = 0.75;
% b = 1;
% a = 1;
% a = [1 zeros(1,d*fs) m*a];
% 
% myIIRaudio = filter(b,a,audio); 
% 
% sig_out(:, 1) = audio;
% sig_out(:, 2) = myIIRaudio;
%  
% soundsc(sig_out, fs); 

%--------------------------------------------------------------------------

% create DTF to remove Mariah's voice from audio3

% plot audio for initial obersvation
%figure(1); clf;
%plot(t_audio3, audio3);
%soundsc(audio3,fs);


b = Num;
a = 1;

output_audio = filter(b,a,audio3);

soundsc(output_audio,fs)
spectrogram(output_audio)



