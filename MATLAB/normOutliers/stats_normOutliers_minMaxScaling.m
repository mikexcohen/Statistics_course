%%
%   COURSE: Master statistics and machine learning: intuition, math, code										
%      URL: udemy.com/course/statsml_x/?couponCode=202304 
% 
%  SECTION: Data normalizations and outliers
%    VIDEO: Min-max scaling
% 
%  TEACHER: Mike X Cohen, sincxpress.com
%

%%

% a clear MATLAB workspace is a clear mental workspace
close all; clear

%% create some data

N = 42;
data = log(rand(N,1))*234 + 934;

% get min and max
dataMin = min(data);
dataMax = max(data);

% now min-max scale
dataS = (data-dataMin) / (dataMax-dataMin);


% now plot
figure(1), clf
subplot(131)
plot(1+randn(N,1)/20,data,'ks','markersize',15)
set(gca,'xlim',[0 2],'xtick',[])
ylabel('Original data scale')
title('Original data')

subplot(132)
plot(1+randn(N,1)/20,dataS,'ks','markersize',15)
set(gca,'xlim',[0 2],'xtick',[])
ylabel('Unity-normed data scale')
title('Scaled data')

% show that scaling doesn't affect the relative data
subplot(133)
plot(data,dataS,'s')
xlabel('Original'), ylabel('Scaled')
axis square


%% any abitrary data range

% step 1 is to [0,1] normalize as above

% step 2:
newMin = 4;
newMax = 8.7;

dataSS = dataS*(newMax-newMin) + newMin;

% test it!
[min(dataSS) max(dataSS)]


%% done.
