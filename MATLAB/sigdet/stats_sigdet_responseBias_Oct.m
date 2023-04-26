%%
%   COURSE: Master statistics and machine learning: intuition, math, code										
%      URL: udemy.com/course/statsml_x/?couponCode=202304 
% 
%  SECTION: Signal detection theory
%    VIDEO: Response bias
% 
%  TEACHER: Mike X Cohen, sincxpress.com
%

%%

% a clear MATLAB workspace is a clear mental workspace
close all; clear; clc
pkg load statistics % load Octave stats package

%% example from the slides

% step 1
hitP = 22/30;
faP  =  3/30;

% step 2
hitZ = norminv(hitP);
faZ  = norminv(faP);

% step 3
dPrime = hitZ-faZ;
respBias = -(hitZ+faZ)/2

%% 2D bias space

% response probabilities
x  = .01:.01:.99;

% and convert to the 2D space like in the d' code
rb = -( norminv(x)' + norminv(x) )/2;

figure(2), clf
contourf(x,x,rb,80,'linecolor','none')
xlabel('False alarm rate')
ylabel('Hit rate')
title('Response bias')
colorbar
axis square

%% done.
