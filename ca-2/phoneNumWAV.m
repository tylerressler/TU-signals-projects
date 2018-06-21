function [phone_number] = phoneNumWAV(filename)
    
    % global 
    clear;
    xlims = [500 1600];             % Frequency limits with ranges of keypad tones
    
    % file read in/plot
    filename = 'phone1.wav';        % define variable for filename
    [x, fs] = audioread(filename);  % sample audio data from .wav
    [X, f] = myFFT(x,fs);           % FFT of sampled data
   
    % Plot defaults
    
    set(0,'DefaultTextFontName','Times',...
'DefaultTextFontSize',18,...
'DefaultAxesFontNam','Times',...
'DefaultAxesFontSize',18,...
'DefaultLineLineWidth',1,...
'DefaultLineMarkerSize',7.75);

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
    
    wind = 1:2205;             % 50 ms window
    figure(2);clf;
    
   % Plot time and frequency data for audio clip
    for n = 1:((length(x)+1)/(length(wind)))-1
        
        subplot(2,1,1);
        plot(t(wind),abs(x(wind)));
        title('Time Signal of phone1.wav')
        xlabel('Time [s]');
        ylabel('x(t)');
        %pause(0.5);
        
        if max(x(wind)) > 0.05
            
            %pause(2);            % Pause to observe frequencies of window
            
            [x, fs] = audioread(filename);  % Obtain sampling data
            
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
        else
            clf;
        end
        
        wind = wind + 2205;                 % move to next window
        
    end
    
freqmaxl(freqmaxl==0) = [];         % remove 0s
freqmaxh(freqmaxh==0) = [];         % remove 0s

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
   
pn = phone_number;
phone1 = [pn(1) pn(7) pn(13) pn(21) pn(26) pn(36) pn(39) pn(45) pn(53) pn(57)]

end % end function