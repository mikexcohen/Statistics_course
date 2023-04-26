%%
%   COURSE: Master statistics and machine learning: intuition, math, code										
%      URL: udemy.com/course/statsml_x/?couponCode=202304 
% 
%  SECTION: Data normalizations and outliers
%    VIDEO: Z-score for outlier removal
% 
%  TEACHER: Mike X Cohen, sincxpress.com
%

%%

% a clear MATLAB workspace is a clear mental workspace
close all; clear; clc

%% create some data

N = 40;
data = randn(N,1);
data(data<-1) = data(data<-1)+2;
data(data>2) = data(data>2).^2; % try to force a few outliers
data = data*200 + 50; % change the scale for comparison with z

% convert to z
dataZ = (data-mean(data)) ./ std(data);


%%% specify the z-score threshold
zscorethresh = 3;


% show the data!
figure(1), clf
subplot(211), hold on
plot(data,'k^','markerfacecolor','w','markersize',12);
set(gca,'xtick',[]), box off
ylabel('Orig. scale')

subplot(212), hold on
plot(dataZ,'k^','markerfacecolor','w','markersize',12);
plot(get(gca,'xlim'),[1 1]*zscorethresh,'--','color','r')
set(gca,'xtick',[]), box off
ylabel('Stdev. units (z)')

%% identify outliers

% find the outliers (note the abs)
outliers = find(abs(dataZ)>zscorethresh);

% identify them in the plot
subplot(211)
plot(outliers,data(outliers),'rx','linew',3,'markersize',20)

subplot(212)
plot(outliers,dataZ(outliers),'rx','linew',3,'markersize',20)

%% iterative method

% pick a lenient threshold just for illustration
zscorethresh = 2;


figure(2), clf, hold on
colorz = 'brkm';
leg = {}; % initialize empty legend
numiters = 1; % iteration counter
while true
    
    % convert to z
    datamean = mean(dataZ,'omitnan');
    datastd  = std(dataZ,'omitnan');
    dataZ = (dataZ-datamean) ./ datastd;
    
    % find data values to remove
    toremove = dataZ>zscorethresh;
    
    % break out of while loop if no points to remove
    if sum(toremove)==0
        break
    else
        % otherwise, mark the outliers in the plot
        plot(find(toremove),dataZ(toremove),[ colorz(numiters) 'x' ],'markersize',12,'HandleVisibility','off')
        dataZ(toremove) = NaN;
    end
    
    % replot
    plot(dataZ,'k^','markersize',12,'markerfacecolor',colorz(numiters))
    
    % update the legend
    leg{numiters} = [ 'iteration ' num2str(numiters) ];
    numiters = numiters + 1;
end

set(gca,'xtick',[])
ylabel('Z-score'), xlabel('Data index')
legend(leg)


%%% the data points to be removed
removeFromOriginal = find(isnan(dataZ));

%% modified Z for non-normal distributions

% compute modified z
dataMed = median(data);
dataMAD = mad(data,1); % IMPORTANT: note the second input

dataMz = norminv(.75)*(data-dataMed) ./ dataMAD;


% show the data!
figure(3), clf
subplot(211), hold on
plot(data,'k^','markerfacecolor','w','markersize',12);
set(gca,'xtick',[]), box off
ylabel('Orig. scale')

subplot(212), hold on
plot(dataMz,'k^','markerfacecolor','w','markersize',12);
plot(get(gca,'xlim'),[1 1]*zscorethresh,'--','color','r')
set(gca,'xtick',[]), box off
ylabel('Median dev. units (Mz)')

%% done.
