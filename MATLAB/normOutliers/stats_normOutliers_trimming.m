%%
%   COURSE: Master statistics and machine learning: intuition, math, code										
%      URL: udemy.com/course/statsml_x/?couponCode=202304 
% 
%  SECTION: Data normalizations and outliers
%    VIDEO: Data trimming to remove outliers
% 
%  TEACHER: Mike X Cohen, sincxpress.com
%

%%

% a clear MATLAB workspace is a clear mental workspace
close all; clear; clc

%% create some data

N = 40;
data = randn(N,1);
data(data<-2) = -data(data<-2).^2;
data(data>2) = data(data>2).^2;

% mean-centered data
dataMC = data - mean(data);

% and plot them (not it ;) )
figure(1), clf
subplot(5,1,2:4), hold on
plot(data,'k^','markerfacecolor','y','markersize',12);
set(gca,'xtick',[],'ytick',[])
xlabel('Data index')
ylabel('Data value')

%% show the mechanism

figure(2), clf
subplot(121)
plot(data,'k^','markerfacecolor','y','markersize',12);
set(gca,'xtick',[]), axis square
title('Original data')
xlabel('Original data index')

subplot(122)
plot(sort(abs(dataMC)),'ko','markerfacecolor','g','markersize',12)
set(gca,'xtick',[]), axis square
title('Sorted data')
xlabel('Sorted data index')


%% option 1: remove k% of the data

% percent of "extreme" data values to remove
trimPct = 5; % in percent

% identify the cut-off (note the abs() )
datacutoff = prctile(abs(dataMC),100-trimPct);

% find the exceedance data values
data2cut = find( abs(dataMC)>datacutoff );

% and mark those off
figure(1)
plot(data2cut,data(data2cut),'rx','markersize',15,'linew',3)

%% option 2: remove k most extreme values

% number of "extreme" data values to remove
k2remove = 3; % in number

% find the exceedance data values
[~,datasortIdx] = sort(abs(dataMC),'descend');
data2cut = datasortIdx(1:k2remove);

% and mark those off
plot(data2cut,data(data2cut),'go','markersize',15,'linew',3)

% finally, add a legend
legend({'All data';[ num2str(100-trimPct) '% threshold' ];[ num2str(k2remove) '-value threshold' ]})

%% done.
