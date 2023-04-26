%%
%   COURSE: Master statistics and machine learning: intuition, math, code										
%      URL: udemy.com/course/statsml_x/?couponCode=202304 
% 
%  SECTION: Probability theory
%    VIDEO: Conditional probability
% 
%  TEACHER: Mike X Cohen, sincxpress.com
%

%%

% a clear MATLAB workspace is a clear mental workspace
close all; clear; clc

%% generate two long-spike time series

N = 10000;
spikeDur  = 10; % a.u. but must be an even number
spikeNumA = .01; % in proportion of total number of points
spikeNumB = .05; % in proportion of total number of points

% initialize to zeros
[spike_tsA,spike_tsB] = deal( zeros(N,1) );


%%% populate time series 1
spiketimesA = randi(N,round(N*spikeNumA),1);

% flesh out spikes (loop per spike)
for spikei=1:length(spiketimesA)
    
    % find boundaries
    bnd_pre = max(1,spiketimesA(spikei)-spikeDur/2);
    bnd_pst = min(N,spiketimesA(spikei)+spikeDur/2);
    
    % fill in with ones
    spike_tsA(bnd_pre:bnd_pst) = 1;
end


%%% repeat for time series 2
spiketimesB = randi(N,round(N*spikeNumB),1);
% spiketimesB(1:length(spiketimesA)) = spiketimesA; % induce strong conditional probability

% flesh out spikes (loop per spike)
for spikei=1:length(spiketimesB)
    
    % find boundaries
    bnd_pre = max(1,spiketimesB(spikei)-spikeDur/2);
    bnd_pst = min(N,spiketimesB(spikei)+spikeDur/2);
    
    % fill in with ones
    spike_tsB(bnd_pre:bnd_pst) = 1;
end


%% let's see what they look like

figure(1), clf
plot(1:N,spike_tsA, 1:N,spike_tsB)
set(gca,'ylim',[0 1.2])


%% compute their probabilities and intersection

% probabilities
probA = sum(spike_tsA==1) / N;
probB = mean(spike_tsB);

% joint probability
probAB = mean(spike_tsA+spike_tsB==2);

%% compute the conditional probabilities

% p(A|B)
pAgivenB = probAB/probB;

% p(B|A)
pBgivenA = probAB/probA;

% print a little report
disp('  ')
disp([ 'P(A)   = ' num2str(probA) ])
disp([ 'P(A|B) = ' num2str(pAgivenB) ])
disp([ 'P(B)   = ' num2str(probB) ])
disp([ 'P(B|A) = ' num2str(pBgivenA) ])

%% done.
