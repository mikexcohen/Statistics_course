%%
%   COURSE: Master statistics and machine learning: intuition, math, code										
%      URL: udemy.com/course/statsml_x/?couponCode=202304 
% 
%  SECTION: Clustering and dimension-reduction
%    VIDEO: K-nearest neighbor
% 
%  TEACHER: Mike X Cohen, sincxpress.com
%

%%

% a clear MATLAB workspace is a clear mental workspace
close all; clear; clc
pkg load statistics % load Octave stats package

%% create data

nPerClust = 50;

% XY centroid locations
A = [  1 0 ];
B = [ -1 0 ];

% generate data
a = [ A(1)+randn(nPerClust,1) A(2)+randn(nPerClust,1) ];
b = [ B(1)+randn(nPerClust,1) B(2)+randn(nPerClust,1) ];

% concatanate into a list
data = [a; b];
grouplabels = [ ones(nPerClust,1); 2*ones(nPerClust,1) ];

% group assignment colors
groupcolors = 'br';


% show the data
figure(1), clf, hold on
plot(data(grouplabels==1,1),data(grouplabels==1,2),'ks','markerfacecolor',groupcolors(1))
plot(data(grouplabels==2,1),data(grouplabels==2,2),'ks','markerfacecolor',groupcolors(2))

%% compute distance matrix

% initialize
distmat = zeros(nPerClust*2);

% loop over elements
for i=1:nPerClust*2
    for j=1:nPerClust*2
        distmat(i,j) = sqrt( (data(i,1)-data(j,1)).^2 + (data(i,2)-data(j,2)).^2 );
    end
end

figure(2), clf
imagesc(distmat), axis square
set(gca,'clim',[0 4])

%% classify the new point

% k parameter
k = 3;

% random new point
newpoint = 2*rand(1,2)-1;

figure(1), hold on
plot(newpoint(1),newpoint(2),'ko','MarkerFaceColor','g','markersize',15)

% compute distance vector
distvec = zeros(nPerClust*2,1);

for i=1:nPerClust*2
    distvec(i) = sqrt( (data(i,1)-newpoint(1)).^2 + (data(i,2)-newpoint(2)).^2 );
end

%% show the distances

figure(3), clf
plot(distvec,'s','markerfacecolor','k')
xlabel('Data element index')
ylabel('Distance to new point')


% sort the distances
[~,sortidx] = sort(distvec,'ascend');

%% find the group assignment of the nearest neighbors

disp(grouplabels(sortidx(1:k)))
whichgroup = median(grouplabels(sortidx(1:k)));

% and re-plot
figure(1)
plot(newpoint(1),newpoint(2),'ko','MarkerFaceColor',groupcolors(whichgroup))
plot(data(sortidx(1:k),1),data(sortidx(1:k),2),'ko','markersize',10)


%% done.
