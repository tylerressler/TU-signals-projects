%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Author: Tyler Ressler
% Date Created: Nov. 10, 2017
% Course: Signals (ECE 3512), Temple University - Fall 2017
% Computer Assignment 04 -- Part 2
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% defaults
set(0,'DefaultFigureWindowStyle','docked') % doc all figures
clc; clear;

% close all figures
for n = 1:12
    figure(n);
    close;
    n = n+1;
end

% load file
filename = 'hw4Data.mat';
load(filename);

% red white blue colormap
rwb = [0 0 .4;  % dark blue
       1 0 0;   % red
       1 0 0;
       1 0 0;
       1 0 0;
       1 1 1];  % white
   
cmap = gray;    % gray colormap

% axis limits
lims = [-1 1 -1 1];

% US Flag
figure(1); clf; set(gcf,'name','US Flag','numbertitle','off');
colormap(rwb); colorbar;
imagesc(us);       

figure(2); clf; set(gcf,'name','US FFT','numbertitle','off'); axis(lims);
colormap(cmap); colorbar;
myFFT2(us,'db');  
%axis(lims); 

% UK Flag
figure(3); clf; set(gcf,'name','UK Flag','numbertitle','off');
colormap(rwb); colorbar;    
imagesc(uk); 

figure(4); clf; set(gcf,'name','UK FFT','numbertitle','off');
colormap(cmap); colorbar;   
myFFT2(uk, 'db'); 
%axis(lims);