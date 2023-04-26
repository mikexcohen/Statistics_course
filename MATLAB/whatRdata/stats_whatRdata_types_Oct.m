%%
%   COURSE: Master statistics and machine learning: intuition, math, code
%      URL: udemy.com/course/statsml_x/?couponCode=202304 
% 
%  SECTION: What are (is?) data?
%    VIDEO: Code: representing types of data on computers
% 
%  TEACHER: Mike X Cohen, sincxpress.com
% 

%%

% a clear MATLAB workspace is a clear mental workspace
close all; clear; clc
pkg load statistics % load Octave stats package

%% create variables of different types (classes)

% data numerical
numdata = [ 1 7 17 1717 ];

% character
chardata = 'xyz';

% string
strdata = "x";

% boolean (aka logical)
logitdata = true;

% cell
celldata = { [3 4 34] , 'hello' , 4 };

% structure
structdata.name = 'Mike';
structdata.age = 25; 
structdata.occupation = 'Nerdoscientist';

%% now let's see what the variables are

whos

% notice the "class" (type) of the variables


%% done.
