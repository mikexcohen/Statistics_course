%%
%   COURSE: Master statistics and machine learning: intuition, math, code										
%      URL: udemy.com/course/statsml_x/?couponCode=202304 
% 
%  SECTION: Probability theory
%    VIDEO: Compute probabilities
% 
%  TEACHER: Mike X Cohen, sincxpress.com
%

%%

% a clear MATLAB workspace is a clear mental workspace
close all; clear
pkg load statistics % load Octave stats package

%% the basic formula

% counts of the different events
c = [ 1 2 4 3 ];

% convert to probability (%)
prob = 100*c / sum(c);

%% the example of drawing marbles from a jar

% colored marble counts
blue   = 40;
yellow = 30;
orange = 20;
totalMarbs = blue + yellow + orange;

% put them all in a jar
jar = cat(1,1*ones(blue,1),2*ones(yellow,1),3*ones(orange,1));

% now we draw 500 marbles (with replacement)
numDraws = 500;
drawColors = zeros(numDraws,1);

for drawi=1:numDraws
    
    % generate a random integer to draw
    randmarble = ceil(rand*numel(jar));
    
    % store the color of that marble
    drawColors(drawi) = jar(randmarble);
end

% now we need to know the proportion of colors drawn
propBlue = sum(drawColors==1) / numDraws;
propYell = sum(drawColors==2) / numDraws;
propOran = sum(drawColors==3) / numDraws;


% plot those against the theoretical probability
figure(1), clf, hold on
bar([ propBlue propYell propOran ])
plot([0.5 1.5],[1 1]*blue/totalMarbs,'b','linewidth',3)
plot([1.5 2.5],[1 1]*yellow/totalMarbs,'b','linewidth',3)
plot([2.5 3.5],[1 1]*orange/totalMarbs,'b','linewidth',3)

set(gca,'xtick',1:3,'XTickLabel',{'Blue';'Yellow';'Orange'})
xlabel('Marble color'), ylabel('Proportion/probability')
legend({'Proportion';'probability'})

%% done.
