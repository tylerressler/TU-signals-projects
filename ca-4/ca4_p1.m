%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Author: Tyler Ressler
% Date Created: Nov. 10, 2017
% Course: Signals (ECE 3512), Temple University - Fall 2017
% Computer Assignment 04 -- Part 1
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

% plot defaults
cmap = gray;

% PART 1.1
figure(1); clf; colormap(cmap); axis equal; set(gcf,'name','Image 1','numbertitle','off');
imagesc(im1);                                   % image 1
figure(2); clf; colormap(cmap); axis equal; set(gcf,'name','Image 1 FFT','numbertitle','off');
myFFT2(im1);                                    % image 1 FFT 

figure(3); clf; colormap(cmap); axis equal; set(gcf,'name','Image 2','numbertitle','off');
imagesc(im2);                                   % image 2
figure(4); clf; colormap(cmap); axis equal; set(gcf,'name','Image 2 FFT','numbertitle','off');
myFFT2(im2);                                    % image 2 FFT 

% PART 1.2
figure(5); clf; colormap(cmap); axis equal; set(gcf,'name','Image 4','numbertitle','off');
imagesc(im4);                                   % image 4
figure(6); clf; colormap(cmap); axis equal; set(gcf,'name','Image 4 FFT','numbertitle','off');
myFFT2(im4);                                    % image 4 FFT 

% PART 1.3
figure(7); clf; colormap(cmap); axis equal; set(gcf,'name','Image 5','numbertitle','off');
imagesc(im5);                                   % image 5
figure(8); clf; colormap(cmap); axis equal; set(gcf,'name','Image 5 FFT','numbertitle','off');
myFFT2(im5);                                    % image 5 FFT 

figure(9); clf; colormap(cmap); axis equal; set(gcf,'name','Image 6','numbertitle','off');
imagesc(im6);                                   % image 6
figure(10); clf; colormap(cmap); axis equal; set(gcf,'name','Image 6 FFT','numbertitle','off');
myFFT2(im6);                                    % image 6 FFT 