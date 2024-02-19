function [ out ] = a1inv( x )
%%
% compute an approximation to the A_1^(-1) (x), the inverse of A_1(x)
% this is from Statistics of Circular Data, Fisher

out = zeros(size(x));

out(x<0.53)=2.*x(x<0.53)+x(x<0.53).^3+5.*x(x<0.53).^5./6;
out(x >= 0.53 & x < 0.85)=-0.4+1.39.*x(x >= 0.53 & x < 0.85)+0.43./(1-x(x >= 0.53 & x < 0.85));
out(x >= 0.85)=1./(x(x >= 0.85).^3-4*x(x >= 0.85).^2+3*x(x >= 0.85));

end

