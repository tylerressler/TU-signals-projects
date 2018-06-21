%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Author: Tyler Ressler
% Date Created: Nov. 10, 2017
% Course: Signals (ECE 3512), Temple University - Fall 2017
% Computer Assignment 04 -- Part 3b
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

% close all figures
for n = 1:12
   figure(n);
     close;
     n = n+1;
 end

% load file
filename = 'hw4Data.mat';
load(filename);

% display pears image
figure(1);  
image(pears);

% display noisy pears image
figure(2);
image(pears_noisy);

% test filter workspace
figure(3);
h = fspecial('average',5);
pearsf = imfilter(pears_noisy, h);  % FILTER THE PEARS!!
imshowpair(pears_noisy,pearsf,'montage')
%image(pearsf);
    
figure(4);
myFFT2(pears, 'db');
axis([-1 1 -1 1]);

figure(5);
myFFT2(pears_noisy, 'db');
axis([-1 1 -1 1]);

figure(6);
myFFT2(pearsf, 'db');
axis([-1 1 -1 1]);

