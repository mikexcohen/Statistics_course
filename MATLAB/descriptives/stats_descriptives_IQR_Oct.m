%%
%   COURSE: Master statistics and machine learning: intuition, math, code										
%      URL: udemy.com/course/statsml_x/?couponCode=202304 
% 
%  SECTION: Descriptive statistics
%    VIDEO: Inter-quartile range
% 
%  TEACHER: Mike X Cohen, sincxpress.com
%

%%

% a clear MATLAB workspace is a clear mental workspace
close all; clear
pkg load statistics % load Octave stats package

%% create data

% random number data
n = 1000;
data = randn(n,1).^2;

% rank-transform the data and scale to 1
dataR = ranks(data)./n;

% find the values closest to 25% and 75% of the distribution
q1 = dsearchn(dataR,.25);
q3 = dsearchn(dataR,.75);

% get the two values in the data
iq_vals = data([ q1 q3 ]);

% IQR is the difference between them
iqrange1 = iq_vals(2) - iq_vals(1);

%% MATLAB function

iqrange2 = iqr(data);

%% done.
