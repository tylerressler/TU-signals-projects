clear;

load('data6.mat'); % loads data

fs = 44100; % samples per second

time_per_window = 0.03; % seconds

t = (1:time_per_window*fs)/fs; % how many points youll get in window 1 (2205)

size_of_freq_array = size(freqs); % returns [ 275 15 ]
total_samples = floor(size_of_freq_array(1)*time_per_window*fs); % total # of samples for clip

x = zeros(1, total_samples); % initialize x to 0

ind= 1:time_per_window*fs;
off = ind + 1103;

for r = 1: size_of_freq_array(1) % 275
    
    for c = 1:size_of_freq_array(2) %15
        
       k = 2*abs(A(r,c)); % magnitude
       p = angle(A(r,c)); % phase
       if r == 1
           x(ind) = x(ind) + k*cos(2*pi*freqs(r,c)*t + p);   % sums 15 cosines in each window
       elseif r == 2                                         % introduces offset at second window
           x(off) = x(off) + k*cos(2*pi*freqs(r,c)*t + p);
       else                                                  % continues 
           x(ind) = x(ind) + k*cos(2*pi*freqs(r,c)*t + p);
       end
    end 
    
    ind = ind + time_per_window*fs;     % increases index by +2205 each cycle
end

t = (1:total_samples)/(fs);   % creates time vector for signal plot

figure(2);
plot(t,x);
xlabel('time(s)');
ylabel('x(t)');
title('Part 2: Data 4-6 Reconstructed Signal');
ylim([-1500 1500]);
soundsc(x, fs);
       