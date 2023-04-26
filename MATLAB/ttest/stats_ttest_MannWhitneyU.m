%%
%   COURSE: Master statistics and machine learning: intuition, math, code										
%      URL: udemy.com/course/statsml_x/?couponCode=202304 
% 
%  SECTION: The t-test family
%    VIDEO: Mann-Whitney U test
% 
%  TEACHER: Mike X Cohen, sincxpress.com
%

%%

% a clear MATLAB workspace is a clear mental workspace
close all; clear

%% generate the data

% the data (note the different sample sizes)
N1 = 30;
N2 = 35;

data1 = poissrnd(2,N1,1);
data2 = poissrnd(1,N2,1);

figure(1), clf, hold on
plot(1+randn(N1,1)/10,data1,'ks','markerfacecolor','w','markersize',10,'linew',2)
plot(2+randn(N2,1)/10,data2,'ro','markerfacecolor','w','markersize',10,'linew',2)

set(gca,'xlim',[0 3],'xtick',1:2)
xlabel('Data group'), ylabel('Data value')

%% now for the test

% ooops!
[p,h,stats] = signrank(data1,data2)

% the right one...
[p,h,stats] = ranksum(data1,data2)
title([ 'Wilcoxon z=' num2str(stats.zval) ', p=' num2str(p) ])


%%%%%%%%%%%%%%%%%%%%%%% IMPORTANT WARNING! %%%%%%%%%%%%%%%%%%%%%%%
% Do not confuse signrank() and ranksum().
% They seem like similar functions, but they're different:
%   signrank() -> one-sample or paired-samples (Wilcoxon signed-rank)
%   ranksum()  -> two independent samples (Mann-Whitney U)
%%%%%%%%%%%%%%%%%%%%%%% IMPORTANT WARNING! %%%%%%%%%%%%%%%%%%%%%%%


%% done.
