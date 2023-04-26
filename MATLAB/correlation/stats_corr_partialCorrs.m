%%
%   COURSE: Master statistics and machine learning: intuition, math, code										
%      URL: udemy.com/course/statsml_x/?couponCode=202304 
% 
%  SECTION: Correlation
%    VIDEO: Partial correlations
% 
%  TEACHER: Mike X Cohen, sincxpress.com
%

%%

% a clear MATLAB workspace is a clear mental workspace
close all; clear; clc

%% the example from the video

% raw correlations
rmg = .7;
rsg = .8;
rms = .9;

% partial correlations
rho_mg_s = (rmg - rsg*rms) / ( sqrt(1-rsg^2)*sqrt(1-rms^2) )
rho_sg_m = (rsg - rmg*rms) / ( sqrt(1-rmg^2)*sqrt(1-rms^2) )

%% now for datasets

N = 76;

% correlated datasets
x1 = linspace(1,10,N)' + randn(N,1);
x2 = x1 + randn(N,1);
x3 = x1 + randn(N,1);


% compute the "raw" correlation matrix
[cormatR,cormatP] = corr([x1 x2 x3]);

% inspect some partial correlations
partialcorr(x2,x3,x1)

%% visualize

figure(1), clf

% raw correlations
subplot(121)
imagesc(cormatR), axis square
set(gca,'clim',[-1 1],'xtick',1:3,'ytick',1:3)
xlabel('Channels'), ylabel('Channels')
title('Raw correlation matrix')

% add text correlation values
for i=1:3
    for j=1:3
        text(i,j,num2str(round(cormatR(i,j),2)),'HorizontalAlignment','center','fontsize',15)
    end
end



% partial correlations
parcormat = partialcorr([x1 x2 x3]);

subplot(122)
imagesc(parcormat), axis square
set(gca,'clim',[-1 1],'xtick',1:3,'ytick',1:3)
xlabel('Channels'), ylabel('Channels')
title('Partial correlation matrix')

% add text correlation values
[I,J] = meshgrid(1:3);
text(I(:),J(:),num2str(round(parcormat(:),2)),'HorizontalAlignment','center','FontSize',15)

%% done.
