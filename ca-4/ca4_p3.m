%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Author: Tyler Ressler
% Date Created: Nov. 10, 2017
% Course: Signals (ECE 3512), Temple University - Fall 2017
% Computer Assignment 04 -- Part 3
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% defaults
set(0,'DefaultFigureWindowStyle','docked') % doc all figures
 set(0,'DefaultTextFontName','Times',...
'DefaultTextFontSize',18,...
'DefaultAxesFontNam','Times',...
'DefaultAxesFontSize',18,...
'DefaultLineLineWidth',1,...
'DefaultLineMarkerSize',7.75);

clc; clear;
lims = [-1 1 -1 1];

% close all figures
for n = 1:12
   figure(n);
     close;
     n = n+1;
 end

% load file
filename = 'hw4Data.mat';
load(filename);

% 3x3 low-pass filter
h =[-0.11   -0.11   -0.11
   -0.11    1.9  -0.11
    -0.11   -0.11   -0.11];

% h1 = fspecial('average', 3);
% h2 = fspecial('average', 30);

figure(1); set(gcf,'name','fspecial FFT plot','numbertitle','off'); 
myFFT2(h);
axis(lims);

% figure(2); set(gcf,'name','fspecial FFT plot 2','numbertitle','off'); 
% myFFT2(h2);
% axis(lims);

% moon image
figure(2); set(gcf,'name','Moon  image','numbertitle','off');
moon = imread('moon.tif');  
image(moon);

% filtered moon image
figure(3); set(gcf,'name','HPF moon image','numbertitle','off');
moonLPF = imfilter(moon,h);
image(moonLPF);

% figure(5); set(gcf,'name','HPF moon image 2','numbertitle','off');
% moonLPF = imfilter(moon,h2);
% image(moonLPF);