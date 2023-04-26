%%
%   COURSE: Master statistics and machine learning: intuition, math, code										
%      URL: udemy.com/course/statsml_x/?couponCode=202304 
% 
%  SECTION: Probability theory
%    VIDEO: cdf's and pdf's
% 
%  TEACHER: Mike X Cohen, sincxpress.com
%

%%

% a clear MATLAB workspace is a clear mental workspace
close all; clear
pkg load statistics % load Octave stats package

%% example using log-normal distribution

% variable to evaluate the functions on
x = linspace(0,5,1001);

% note the function call pattern...
p1 = lognpdf(x,0,1);
c1 = logncdf(x,0,1);

p2 = lognpdf(x,0,.1);
c2 = logncdf(x,0,.1);


% draw the pdfs
figure(1), clf
subplot(211)
plot(x,p1./sum(p1),'linewidth',3) % question: why divide by sum here?
plot(x,p1./sum(p1), x,p2./sum(p2),'linewidth',3)
box off
set(gca,'ylim',[0 .0201])
ylabel('probability')
title('pdf(x)')

% draw the cdfs
subplot(212)
plot(x,c1,'linewidth',3)
plot(x,c1, x,c2,'linewidth',3)
box off
ylabel('probability')
title('cdf(x)')

%% computing the cdf from the pdf

% compute the cdf
c1x = cumsum( p1 );

figure(2), clf, hold on
plot(x,c1,'linewidth',3)
plot(x,c1x,'--','linewidth',3)

%% done.
