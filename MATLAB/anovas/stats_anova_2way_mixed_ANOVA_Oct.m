%%
%   COURSE: Master statistics and machine learning: intuition, math, code										
%      URL: udemy.com/course/statsml_x/?couponCode=202304 
% 
%  SECTION: Analysis of Variance (ANOVA)
%    VIDEO: Two-way mixed-effects ANOVA
% 
%  TEACHER: Mike X Cohen, sincxpress.com
%

%%

% a clear MATLAB workspace is a clear mental workspace
close all; clear, clc
pkg load statistics % load Octave stats package

%% the data and group labels

data = csvread('TwoWayMixedANOVA_data.csv');

gr1 = repmat(1:3,size(data,1),1);
gr2 = [1*ones(15,1); 2*ones(15,1); 3*ones(15,1)];
gr2 = [gr2; gr2; gr2];



%% run the ANOVA
% SUPER IMPORTANT NOTE: 
%     As of this writing, Octave does not have a function for mixed-effects multi-factorial ANOVAs.
%     The code below shows how to run a multi-factorial *between-subjects* ANOVA. It is not the 
%     correct model for this example, but I show the code here in case it's helpful.
anovan(data(:),[gr1(:) gr2],'model','full')

%% done.
