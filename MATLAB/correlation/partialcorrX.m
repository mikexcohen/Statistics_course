function rho=partialcorrX(x1,x2,x3)
% rho = partialcorrX(x1,x2,x3)
%    Computes partial correlation between x1 and x2,
%    while partialing out shared variance with x3.
% 
%  This function can replace the MATLAB partialcorr function.
%
% Mike X Cohen - sincxpress.com

% raw correlations
r12 = corr(x1,x2);
r13 = corr(x1,x3);
r23 = corr(x2,x3);

% partial correlation
rho = (r12 - r13*r23) / ( sqrt(1-r13^2)*sqrt(1-r23^2) );
