%%
%   COURSE: Master statistics and machine learning: intuition, math, code										
%      URL: udemy.com/course/statsml_x/?couponCode=202304 
% 
%  SECTION: The t-test family
%    VIDEO: Permutation testing
% 
%  TEACHER: Mike X Cohen, sincxpress.com
%

%%

% a clear MATLAB workspace is a clear mental workspace
close all; clear; clc
pkg load statistics % load Octave stats package

%% 

%% simulate two distributions

% number of trials
N = 100;

% dataset "A"
r = randn(N,1);
r(r>0) = log(1+r(r>0));
dataA = 26-r*10;

% get histogram values for later comparison
[yA,xA] = hist(dataA,20);


% dataset "B"
r = randn(N,1);
r(r>0) = log(1+r(r>0));
dataB = 30-r*10;

% get histogram values for later comparison
[yB,xB] = hist(dataB,20);


figure(1), clf, hold on
stem(xA,yA,'b','linewidth',3)
stem(xB,yB,'r','linewidth',3)
legend({'Data "A"';'Data "B"'})

%% mix trials together

% concatenate trials
alldata = cat(1,dataA,dataB);

% condition labels
conds = cat(1,ones(N,1),2*ones(N,1));

%% generate one null hypothesis scenario

% random permutation
fakeconds = randperm(N*2);

% shuffled condition labels
fakeconds(fakeconds<N+1) = 1;
fakeconds(fakeconds>1) = 2;


% these two means should be different.
[mean(alldata(conds==1)) mean(alldata(conds==2))]

% should these two be different?
[mean(alldata(fakeconds==1))  mean(alldata(fakeconds==2)) ]

%% and now a distribution of null hypothesis values

nPerms = 1000;
permdiffs = zeros(nPerms,1);

for permi=1:nPerms
    fconds = randperm(N*2);
    fconds(fconds<N+1) = 1;
    fconds(fconds>1) = 2;
    permdiffs(permi) = mean(alldata(fconds==2)) - mean(alldata(fconds==1));
end


% plot the distribution of H0 values
figure(2), clf
hist(permdiffs,50)
hold on

% and plot the observed value on top
obsval = mean(alldata(conds==2)) - mean(alldata(conds==1));
plot([obsval obsval],get(gca,'ylim'),'m','linewidth',10)
xlabel('Value'), ylabel('Count')

%% two methods of evaluating statistical significance

% Z-value
zVal = ( obsval-mean(permdiffs) ) / std(permdiffs);
p = 1-normcdf(abs(zVal));

% p-value count
pCount = sum(permdiffs>obsval)/nPerms;

%% done.
