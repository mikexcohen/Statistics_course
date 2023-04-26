%%
%   COURSE: Master statistics and machine learning: intuition, math, code										
%      URL: udemy.com/course/statsml_x/?couponCode=202304 
% 
%  SECTION: Signal detection theory
%    VIDEO: d-prime
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
dPrime = hitZ-faZ

%% failure scenarios and their resolutions

hitZ = norminv(17/30);
faZ  = norminv(10/30);
dPrime = hitZ-faZ

%% 2D d' space

% response probabilities
x  = .01:.01:.99;
x = logspace(log10(.01),log10(.99),99);

% generate the space using MATLAB's new expansion capability
dp = norminv(x)' - norminv(x);
% if the previous line doesn't work:
% dp = bsxfun(@minus,norminv(x)',norminv(x));

% show the 2D d' space
figure(1), clf
contourf(x,x,dp,80,'linecolor','none')
xlabel('False alarm rate')
ylabel('Hit rate')
axis square
title('d''')
colorbar

%% done.
