clear;

load('data1.mat'); % loads data

fs = 44100; % samples per second

time_per_window = 0.05; % seconds

t = (1:time_per_window*fs)/fs; % how many points youll get in window 1 (2205)

size_of_freq_array = size(freqs); % returns [ 131 15 ]
total_samples = floor(size_of_freq_array(1)*time_per_window*fs); % total # of samples for clip

x = zeros(1, total_samples); % initialize x to 0

ind= 1:time_per_window*fs;

for r = 1: size_of_freq_array(1) % 131
    
    for c = 1: size_of_freq_array(2) % 15
        
       k = 2*abs(A(r,c)); % magnitude
       p = angle(A(r,c)); % phase
       x(ind) = x(ind) + k*cos(2*pi*freqs(r,c)*t + p); % sums 15 cosines in each window
    end 
    
    ind = ind + time_per_window*fs; % increases index by +2205 each cycle
   
end

t = (1:total_samples)/fs; % creates time vector from 0 - 6.55 seconds

plot(t,x); 
xlabel('time(s)');
ylabel('x(t)');
title('Part 2: Data 1-3 Reconstructed Signal');
ylim([-1500 1500]);

soundsc(x, fs);

filename = 'data1.wav';
audiowrite(filename,x,fs);
       