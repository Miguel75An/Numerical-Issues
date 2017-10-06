
%Here we have a four point interpolation problem

%Given points to us are (-2,10),(-1,4),(1,6) and (2,3)

%We would like to find the coefficients for the interpolant:
% p3(x) = a + bx + cx^2 + dx^3

%If we plug in the points we end up with a set of linear equations

%   a - 2b + 4c - 8d = 10
%   a -  b +  c -  d = 4
%   a +  b +  c +  d = 6
%   a + 2b + 4c + 8d = 3


%That can be express using matrices

% |1 -2  4 -8|   |a|   |10|
% |1 -1  1 -1| X |b| = | 4|
% |1  1  1  1|   |c|   | 6|
% |1  2  4  8|   |d|   | 3|

%In Matlab stuff that would be:

y = [10; 4; 6; 3];

V = [1 -2 4 -8;
     1 -1 1 -1;
     1  1 1  1;
     1  2 4  8;];
 
%The '\' is a left matrix divide. So when we do A\B we are kinda doing
%the following: INVERSE(A)*B  ... CHECK YOUR LINEAR ALGEBRA!!!

Coefficients = V\y;

%We get the following for our coefficients
% [4.50000000000000;1.91666666666667;0.500000000000000;-0.916666666666667]