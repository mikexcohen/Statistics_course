%%
%   COURSE: Master statistics and machine learning: intuition, math, code										
%      URL: udemy.com/course/statsml_x/?couponCode=202304 
% 
%  SECTION: Descriptive statistics
%    VIDEO: Violin plots
% 
%  TEACHER: Mike X Cohen, sincxpress.com
%

%%

% a clear MATLAB workspace is a clear mental workspace
close all; clear
pkg load statistics % load Octave stats package

%% create the data

n = 1000;
thresh = 5; % threshold for cropping data

data = exp( randn(n,1) );
data(data>thresh) = thresh + randn(sum(data>thresh),1)*.1;

% get data distribution based on histogram
[y,x] = hist(data,'BinMethod','fd');
y = y./max(y);

% upsample to make the plot look nicer
% y = interp1(y,linspace(1,length(y),100),'pchip');
% x = interp1(x,linspace(1,length(x),100),'pchip');

% inter-quartile range
dataR = ranks(data)./n;
IQR = data([dsearchn(dataR,.25) dsearchn(dataR,.75)]);

%% show the violin plot

% first show the histogram
figure(1), clf
subplot(411)
hist(data,30)
xlabel('Data value'), ylabel('Count')
box off

% main plot is a patch
subplot(4,1,2:4)
patch([y -y(end:-1:1)] , [x x(end:-1:1)], 'm','facealpha',.5)
hold on

% plot other descriptive stats
plot([0 0],IQR,'k','linewidth',3)
plot(0,mean(data),'ks','markerfacecolor','r','markersize',10)
plot(0,median(data),'ko','markerfacecolor','g','markersize',10)

legend({'Distribution';'IQR';'Mean';'Median'})
set(gca,'xlim',[-1 1]*5,'xtick',[])

title('Violin plot')
ylabel('Data values')

%% done.
