%%
%   COURSE: Master statistics and machine learning: intuition, math, code										
%      URL: udemy.com/course/statsml_x/?couponCode=202304 
% 
%  SECTION: Analysis of Variance (ANOVA)
%    VIDEO: One-way repeated-measures ANOVA
% 
%  TEACHER: Mike X Cohen, sincxpress.com
%

%%

% a clear MATLAB workspace is a clear mental workspace
close all; clear; clc
pkg load statistics % load Octave stats package

%% data parameters

% treatment means
mean1 = 4;
mean2 = 3.8;
mean3 = 7;

% samples (note: same across treatments)
N = 30;

% standard deviation (assume common across groups)
stdev = 2;

%% now to simulate the data

data1 = mean1 + randn(N,1)*stdev;
data2 = mean2 + randn(N,1)*stdev;
data3 = mean3 + randn(N,1)*stdev;

%% run the repeated-measures ANOVA

% first create the data table
tabl = [data1 data2 data2];

% create a model to be fit
[p,anovatable] = repanova(tabl,{'t1','t2','t3'},'string');
anovatable


%% example from SPSS website

% https://www.spss-tutorials.com/repeated-measures-anova/

data = [
    8	7	6	7
    5	8	5	6
    6	5	3	4
    6	6	7	3
    8	10	8	6
    6	5	6	3
    6	5	2	3
    9	9	9	6
    5	4	3	7
    7	6	6	5];

% now fit the model
[p,anovatable] = repanova(data,{'t1','t2','t3','t4'},'string');

%% done.
