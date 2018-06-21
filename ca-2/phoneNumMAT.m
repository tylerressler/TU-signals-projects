function [phone_number] = phoneNumMAT(matfilename)


freqs = 0;
%matfilename = 'phone2.mat';
load(matfilename);
xlims = [500 1600];


% Code from CA 1 to create x(t) signal of frequency data

time_per_window = 0.075; % seconds

t = (1:time_per_window*fs)/fs; % how many points youll get in window 1 (2205)

size_of_freq_array = size(freqs); % returns [ 226 15 ]
total_samples = floor(size_of_freq_array(1)*time_per_window*fs); % total # of samples for clip

x = zeros(1, total_samples); % initialize x to 0

ind = 1:floor(time_per_window*fs);

for r = 1: size_of_freq_array(1) % 226
    
    for c = 1: size_of_freq_array(2) % 15
        
       k = 2*abs(A(r,c)); % magnitude
       p = angle(A(r,c)); % phase
       x(ind) = x(ind) + k*cos(2*pi*freqs(r,c)*t + p); % sums 15 cosines in each window
    end 
    
    ind = ind + floor(time_per_window*fs); % increases index by +2205 each cycle
   
end

    [X, f] = myFFT(x,fs);           % FFT of sampled data
    
% Time plot
    figure(1);clf;
    subplot(2,1,1);
    t = (1:length(x))/fs;       % time vector [s]
    plot(t,abs(x));
    title('Time Signal of phone1.wav')
    xlabel('Time [s]');
    ylabel('x(t)');
 % Frequency Plot
    subplot(2,1,2);
    plot(f,abs(X));
    xlim(xlims);
    grid on;
    xlabel('Frequency [Hz]');
    ylabel('Magnitude');
    title('Fourier Transform Analysis of phone1.wav')
% Code from Part 1 of CA2 ------------------------------

    wind = 1:2205;             % 50 ms window
    figure(2);clf;
    
for n = 1:((length(x)+1)/(length(wind)))-1
        
        subplot(2,1,1);
        t = (1:length(x))/fs;
        plot(t(wind),abs(x(wind)));
        title('Time Signal of phone2.mat')
        xlabel('Time [s]');
        ylabel('x(t)');
        
        if max(x(wind)) > 100
            
            %pause(0.25);            % Pause to observe frequencies of window
            
            subplot(2,1,2);                 % plot FFT data
            [Z, f2] = myFFT(x(wind),fs);    % FFT of sampled data
            plot(f2, abs(Z));
            xlim(xlims);                    % set frequency limits
            grid on;
            xlabel('Frequency [Hz]');
            ylabel('Magnitude');
            title('Fourier Transform Analysis of phone1.wav')
            
            [maxval, fmax] = findpeaks(abs(Z), f2, 'sortStr', 'descend');
            freqmaxl(n) = fmax(2);         % array of lower frequency vals
            freqmaxh(n) = fmax(4);         % array of higher frequency in array
            
            freqmaxl(freqmaxl==0) = [];         % remove 0s
            freqmaxh(freqmaxh==0) = [];         % remove 0s
 
        else
           %clf; 
        end
     
        wind = wind + 2205;                 % move to next window
        
end

% determine phone number
phone_number = zeros(1,10);
q = 0; 

for q = 1:(floor(length(freqmaxl)))
    if (freqmaxl(q) > 600) && (freqmaxl(q) < 720)
        if (freqmaxh(q) > 1100) && (freqmaxh(q) < 1300)
            phone_number(q) = 1;
        elseif (freqmaxh(q) > 1300) && (freqmaxh(q) < 1380)
            phone_number(q) = 2;
        else
            phone_number(q) = 3;
        end
    elseif (freqmaxl(q) > 720) && (freqmaxl(q) < 800)
        if (freqmaxh(q) > 1100) && (freqmaxh(q) < 1300)
            phone_number(q) = 4;
        elseif (freqmaxh(q) > 1300) && (freqmaxh(q) < 1380)
            phone_number(q) = 5;
        else
            phone_number(q) = 6;
        end
    elseif (freqmaxl(q) > 800) && (freqmaxl(q) < 900)
        if (freqmaxh(q) > 1100) && (freqmaxh(q) < 1300)
            phone_number(q) = 7;
        elseif (freqmaxh(q) > 1300) && (freqmaxh(q) < 1380)
            phone_number(q) = 8;
        else
            phone_number(q) = 9;
        end
    else
        phone_number(q) = 0;
    end

end  % end for

phone2 = 0;
pn = phone_number;
phone2 = [pn(1) pn(16) pn(31) pn(46) pn(61) pn(71) pn(96) pn(106) pn(126) pn(146)]

end % end function





    
   