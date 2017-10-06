%[1] Base spacing for Interpolation

x = [0 1 2]; %First try spacing of 1 for three x points.
%This spacing gives us coefficients that do interpolate some of the points
%in the range [0 2] but it's precision is of only one decimal digit.

%=================
%x = [1.9998 1.9999 2] % Using this small spacing og 0.0001 we do achieve the
%the 4 decimal precision we desire BUT only for the right most (x) vales.
%The middle and left values lost a lot of precision as compared to the actual values
%if we were to use the function exp(x).%=*sin(x)
%=================

%IN OTHER WORDS, if we want 4 DECIMAL PRECISION we have two choices (we can
%think of). The first one since we have a small range is to increase the
%number of points and obtain a larger n polynomial interpolant. HOWEVER, we
%want a QUADRATIC ONE. The best we can achieve is to use 3 points that are
%closely together and find the coefficients. Those coefficients will be
%interpolate the values around those 3 points but not the far away points.


inity = exp(x).*sin(x); %Initial y values used to get the coefficients
y = exp(x).*sin(x); %Initial y values, vector used in calculations

tx = linspace(0,2,1000); %1000 x values used to visualize the results of
                         %when we obtain the interpolant
original = (exp(1).^tx).*sin(tx); %1000 y values when we use the original function

n = length(x);

for k = 1:n-1 %Here we find coefficients (c) using Newtown's approach.
    y(k+1:n) = (y(k+1:n)-y(k)) ./ (x(k+1:n) - x(k)); %Each coefficient is computed recursively
end

c = y; % C becomes the vector of coefficients needed for the interpolant

p2 = c(1) + c(2).*(x-x(1)) + c(3).*(x-x(1)).*(x-x(2)); %Interpolant polynomial
%expressed in Newtown's form with coefficients.

ty = c(1) + c(2).*(tx-x(1)) + c(3).*(tx-x(1)).*(tx-x(2));
%The above are the results from the 1000 values x

difference = original - ty; %Here we would like the difference to approach zero 
%if our interpolant does interpolate all points in the given range

%Spacing of 1 between the three points used for interpolation seems
%efficient enough to reach one decimal place accuracy. 

 

