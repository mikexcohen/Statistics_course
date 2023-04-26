%%
%   COURSE: Master statistics and machine learning: intuition, math, code										
%      URL: udemy.com/course/statsml_x/?couponCode=202304 
% 
%  SECTION: Signal detection theory
%    VIDEO: ROC curves
% 
%  TEACHER: Mike X Cohen, sincxpress.com
%

%%

% a clear MATLAB workspace is a clear mental workspace
close all; clear; clc

%% recreate the matrices

x  = .01:.01:.99;
dp = norminv(x)' - norminv(x);
rb = -( norminv(x)' + norminv(x) )/2;

%% create the 2D spaces

figure(1), clf
subplot(121), hold on
contourf(x,x,dp,80,'linecolor','none')
xlabel('False alarm rate')
ylabel('Hit rate')
title('d''')
axis square

subplot(122), hold on
contourf(x,x,rb,80,'linecolor','none')
xlabel('False alarm rate')
ylabel('Hit rate')
title('Response bias')
axis square

%% now draw the isocontours

colorz = 'rbmk';
rb2plot = [.3 .5 .9 1.5];
tol = .01;

for dpi=1:length(rb2plot)
    
    % d': find points and plot isosensitivity curves
    idx = find(dp>rb2plot(dpi)-tol & dp<rb2plot(dpi)+tol);
    [yi,xi] = ind2sub(size(dp),idx);
    subplot(121)
    plot(x(xi),x(yi),[ colorz(dpi) 'o-' ],'markersize',4,'markerfacecolor',colorz(dpi))
    
    % repeat for response bias
    idx = find(rb>rb2plot(dpi)-tol & rb<rb2plot(dpi)+tol);
    [yi,xi] = ind2sub(size(rb),idx);
    subplot(122)
    plot(x(xi),x(yi),[ colorz(dpi) 'o-' ],'markersize',4,'markerfacecolor',colorz(dpi))
end

%% done.
