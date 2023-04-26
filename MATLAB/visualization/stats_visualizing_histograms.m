%%
%   COURSE: Master statistics and machine learning: intuition, math, code
%      URL: udemy.com/course/statsml_x/?couponCode=202304 
% 
%  SECTION: Visualizing data
%    VIDEO: Code: Histograms
% 
%  TEACHER: Mike X Cohen, sincxpress.com
%

%%

% a clear MATLAB workspace is a clear mental workspace
close all; clear

%% create data for the plot

% number of data points
n = 1000;

% generate log-normal distribution
data = exp( randn(n,1)/2 );

%% show a histogram

% number of histogram bins
k = 40;

figure(1), clf

% one way to show a histogram
histogram(data,k)

% another option
[y,x] = hist(data,k);
plot(x,y,'s-','linew',2,'markersize',12,'markerfacecolor','k')
xlabel('Value')
ylabel('Count')

%% movie showing histograms with increasing bins

bins2try = round( linspace(5,n/2,30) );

h = plot(x,y,'s-','linew',2,'markersize',12,'markerfacecolor','k');
xlabel('Value'), ylabel('Count')

for bini=1:length(bins2try)
    % use hist to get histogram graph data for this bin count
    [y,x] = histcounts(data,bins2try(bini));
    
    % update xdata and ydata
    set(h,'XData',x,'ydata',y);
    
    % update title
    title([ 'Histogram with ' num2str(bins2try(bini)) ' bins.' ])
    pause(.5)
end


%% done.
