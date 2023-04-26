%%
%   COURSE: Master statistics and machine learning: intuition, math, code										
%      URL: udemy.com/course/statsml_x/?couponCode=202304 
% 
%  SECTION: Correlation
%    VIDEO: Spearman correlation and Fisher-Z
% 
%  TEACHER: Mike X Cohen, sincxpress.com
%

%%

% a clear MATLAB workspace is a clear mental workspace
close all; clear; clc

%% Anscobe's quartet


anscombe = [
  % series 1    series 2    series 3     series 4
    10  8.04    10  9.14    10  7.46     8  6.58;
     8  6.95     8  8.14     8  6.77     8  5.76;
    13  7.58    13  8.76    13 12.74     8  7.71;
     9  8.81     9  8.77     9  7.11     8  8.84;
    11  8.33    11  9.26    11  7.81     8  8.47;
    14  9.96    14  8.10    14  8.84     8  7.04;
     6  7.24     6  6.13     6  6.08     8  5.25;
     4  4.26     4  3.10     4  5.39     8  5.56;
    12 10.84    12  9.13    12  8.15     8  7.91;
     7  4.82     7  7.26     7  6.42     8  6.89;
     5  5.68     5  4.74     5  5.73    19 12.50;
    ];


% plot and compute correlations
figure(1), clf
for i=1:4
    subplot(2,2,i)
    plot(anscombe(:,(i-1)*2+1),anscombe(:,(i-1)*2+2),'ko','markersize',8,'markerfacecolor',[.4 .6 .9])
    h = lsline;
    set(h,'linew',2,'color',[.6 .8 .9])
    axis square
    set(gca,'xtick',[],'ytick',[])
    corr_p = corr(anscombe(:,(i-1)*2+1),anscombe(:,(i-1)*2+2),'type','p');
    corr_s = corr(anscombe(:,(i-1)*2+1),anscombe(:,(i-1)*2+2),'type','s');
    title([ 'r_p = ' num2str(round(corr_p*100)/100) ';   r_s = ' num2str(round(corr_s*100)/100) ])
end

%% Fisher-Z transform


% simulate correlation coefficients
N = 10000;
r = 2*rand(N,1) - 1;

% Fisher-Z
fz = atanh(r);



figure(2), clf
subplot(5,1,2:4), hold on
% overlay the Fisher-Z
[y,x] = histcounts(fz,30);
x = (x(2:end)+x(1:end-1))/2;
h = bar(x,y);
set(h,'FaceColor','r','FAceAlpha',.5)

% raw correlations
[y,x] = histcounts(r,30);
x = (x(2:end)+x(1:end-1))/2;
h = bar(x,y);
set(h,'FaceColor','b','FAceAlpha',.5)


set(gca,'xlim',[-1 1]*4,'yticklabel',[])
xlabel('r / f')
ylabel('Count')
legend({'Fisher-Z';'Raw r'})

%%

figure(3), clf, hold on
plot(1:N,sort(r),'o','markerfacecolor','w','markersize',7)
plot(1:N,sort(fz),'o','markerfacecolor','w','markersize',7)
box off
set(gca,'xlim',[-5 N+5],'XTickLabel',[],'ylim',[-1 1]*5.5)
ylabel('Value')
legend('Correlation','Fisher-Z','box','off')

% zoom in
% set(gca,'ylim',[-1 1]*.8)

%% done.
