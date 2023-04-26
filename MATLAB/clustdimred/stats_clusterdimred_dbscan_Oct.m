%%
%   COURSE: Master statistics and machine learning: intuition, math, code										
%      URL: udemy.com/course/statsml_x/?couponCode=202304 
% 
%  SECTION: Clustering and dimension-reduction
%    VIDEO: dbscan
% 
%  TEACHER: Mike X Cohen, sincxpress.com
%

%%

% a clear MATLAB workspace is a clear mental workspace
close all; clear; clc

%% create data (identical to k-means!)

nPerClust = 50;

% blur around centroid (std units)
blur = .5;

% XY centroid locations
A = [  1 1 ];
B = [ -3 1 ];
C = [  3 3 ];

% generate data
a = [ A(1)+randn(nPerClust,1)*blur A(2)+randn(nPerClust,1)*blur ];
b = [ B(1)+randn(nPerClust,1)*blur B(2)+randn(nPerClust,1)*blur ];
c = [ C(1)+randn(nPerClust,1)*blur C(2)+randn(nPerClust,1)*blur ];

% concatanate into a list
data = [a; b; c];

% show the data
figure(1), clf
subplot(121)
plot(data(:,1),data(:,2),'s','markerfacecolor','k')
axis square
title('How we see the data')


%%% distance matrix
D = zeros(size(data,1));
for i=1:length(D)
    for j=1:length(D)
        D(i,j) = sqrt( (data(i,1)-data(j,1))^2 + (data(i,2)-data(j,2))^2 );
    end
end
subplot(122)
imagesc(D)
axis square
title('How dbscan sees the data')

%% dbscan
%%%%% IMPORTANT NOTE: The dbscan function was downloaded from https://www.peterkovesi.com/projects/segmentation/
% I included it here for accessibility. I was not involved in writing or testing this function,
% so I am providing it as-is with no guarantees to its accuracy. The inputs and outputs are slightly
% different compared to MATLAB.

[~,groupidx] = dbscan_Oct(data',1,9);

nclust = max(groupidx);

% compute cluster centers
cents = zeros(nclust,2);
for ci=1:nclust
    cents(ci,:) = mean(data(groupidx==ci,:));
end

% draw lines from each data point to the centroids of each cluster
figure(4), clf
lineColors = 'rmbgmrkbgmrkbgmrkbgmrkbgmrkbgmrkbgmrkbgmrkbgmrkbgmrkbgmrkbgm';
hold on
for i=1:length(data)
    if groupidx(i)==-1
        plot(data(i,1),data(i,2),'w+')
    else
        plot([ data(i,1) cents(groupidx(i),1) ],[ data(i,2) cents(groupidx(i),2) ],lineColors(groupidx(i)))
    end
end

% now draw the raw data in different colors
for i=1:nclust
    plot(data(groupidx==i,1),data(groupidx==i,2),[ lineColors(i) 'o' ],'markerface','w')
end

% and now plot the centroid locations
plot(cents(:,1),cents(:,2),'ko','markerface','g','markersize',10);
xlabel('Axis 1'), ylabel('Axis 2')
title([ 'Result of dbscan clustering (k=' num2str(size(cents,1)) ')' ])

% finally, the "ground-truth" centers
plot(A(1),A(2),'kp','linewidth',2,'markersize',20,'markerfacecolor','y')
plot(B(1),B(2),'kp','linewidth',2,'markersize',20,'markerfacecolor','y')
plot(C(1),C(2),'kp','linewidth',2,'markersize',20,'markerfacecolor','y')

%% testing the parameter space

% parameter ranges
epsilons = linspace(.1,2,40);
minpoints = 1:30;

% initialize results matrix
results = zeros(length(epsilons),length(minpoints),2);

%% NOTE: This loop takes a while to run.... start it and get a coffee ;)
for ei=1:length(epsilons)
    for di=1:length(minpoints)
        [~,groupidx] = dbscan_Oct(data',epsilons(ei),minpoints(di));
        results(ei,di,1) = max(groupidx);
        results(ei,di,2) = sum(groupidx==-1);
    end
end

figure(3), clf
subplot(121)
imagesc(minpoints,epsilons,squeeze(results(:,:,1)))
axis square, axis xy
set(gca,'clim',[1 5])
xlabel('Minimum points'), ylabel('Epsilon')
title('Number of groups')
colormap(jet(10))
colorbar

subplot(122)
imagesc(minpoints,epsilons,squeeze(results(:,:,2)))
axis square, axis xy
set(gca,'clim',[1 length(data)/3])
xlabel('Minimum points'), ylabel('Epsilon')
title('Number of "noise" points')
colorbar

%% determining the appropriate parameters

% NOTE: The thesis I linked in the video is no longer available. 
%    There are several methods to determine an appropriate epsilon
%    parameter, depending on the nature of the data and level of
%    sophistication required. I hope the references below are helpful; you
%    can also google around to find more tips for picking parameters.
% 
% https://towardsdatascience.com/machine-learning-clustering-dbscan-determine-the-optimal-value-for-epsilon-eps-python-example-3100091cfbc
% https://core.ac.uk/download/pdf/219373759.pdf
% https://www.biorxiv.org/content/10.1101/2020.07.09.195784v2.full.pdf

D = zeros(size(data,1),1);

for i=1:size(data,1)
    % compute distance
    d = sqrt( (data(i,1)-data(:,1)).^2 + (data(i,2)-data(:,2)).^2 );
    
    % distance to 3rd closest point
    d = sort(d,'ascend');
    D(i) = d(4); 
end

figure(4), clf
plot(sort(D,'ascend'),'s-')


%% Try again with nonlinear clusters

N = 1000;
th = linspace(0,2*pi,N)';

% create the two circles
data1 = [ cos(th) sin(th) ] + randn(N,2)/15;
data2 = .3*[ cos(th) sin(th) ] + randn(N,2)/15;

% put them together into one dataset
circdata = [data1; data2];

% plot
figure(5), clf
plot(circdata(:,1),circdata(:,2),'o')

%% dbscan

[~,groupidx] = dbscan_Oct(circdata',.2,2);
nclust = max(groupidx);

% now draw the raw data in different colors
clf, hold on
for i=1:nclust
    plot(circdata(groupidx==i,1),circdata(groupidx==i,2),[ lineColors(i) 'o' ],'markerface','w')
end

% and plot unassigned data
plot(circdata(groupidx==-1,1),circdata(groupidx==-1,2),'k+')


title([ 'Result of dbscan clustering (k=' num2str(nclust) ')' ])


%% done.
