%%
%   COURSE: Master statistics and machine learning: intuition, math, code										
%      URL: udemy.com/course/statsml_x/?couponCode=202304 
% 
%  SECTION: The t-test family
%    VIDEO: Signed-rank test (Wilcoxon signed-rank for one-sample or paired samples)
% 
%  TEACHER: Mike X Cohen, sincxpress.com
%

%%

% a clear MATLAB workspace is a clear mental workspace
close all; clear; clc

%% generate the data

N = 30;

data1 = poissrnd(1.5,N,1);
data2 = poissrnd(1,N,1);

figure(1), clf, hold on

colors = 'kr';
for i=1:N
    plot([data1(i) data2(i)],[i i],colors((data1(i)<data2(i))+1),'HandleVisibility','off')
end

plot(data1,1:N,'ks','markerfacecolor','k','markersize',10)
plot(data2,1:N,'ro','markerfacecolor','r','markersize',10)

set(gca,'ylim',[0 N+1],'xlim',[-.5 max([data1;data2])+.5],'xtick',0:5)
ylabel('Data index'), xlabel('Data value')
grid minor
legend({'data1';'data2'})

%% now for the test

[p,h,stats] = signrank(data1,data2)
title([ 'Wilcoxon z=' num2str(stats.zval) ', p=' num2str(p) ])

% note: the z-value is computed only for N>14; see signrank.m


%%%%%%%%%%%%%%%%%%%%%%% IMPORTANT WARNING! %%%%%%%%%%%%%%%%%%%%%%%
% Do not confuse signrank() and ranksum().
% They seem like similar functions, but they're different:
%   signrank() -> one-sample or paired-samples (Wilcoxon signed-rank)
%   ranksum()  -> two independent samples (Mann-Whitney U)
%%%%%%%%%%%%%%%%%%%%%%% IMPORTANT WARNING! %%%%%%%%%%%%%%%%%%%%%%%


%% now for the 2D space

% parameter ranges
Ns = 5:50;
lambdas = linspace(1,3,40);

% initialize output matrix
pvals = nan(length(Ns),length(lambdas));

for ni=1:length(Ns)
    for li=1:length(lambdas)
        
        % generate some data
        data1 = poissrnd(lambdas(1), Ns(ni),1);
        data2 = poissrnd(lambdas(li),Ns(ni),1);
        
        % compute the statistic
        [p,h,stats] = signrank(data1,data2);
        
        % store the results
        pvals(ni,li) = -log(p);
    end
end

% optional p-value thresholding
pvalthresh = .01;
pvals( pvals<-log(pvalthresh) ) = NaN;


% now show in a heatmap!
figure(2), clf
imagesc(lambdas,Ns,pvals)
xlabel('lambda difference')
ylabel('Sample size')
title('Signed-rank test results: -log(p)')
set(gca,'clim',[0 max(pvals(:))*.8],'ydir','normal')
colorbar

%% done.
