
%[3] Position and Dosage Interpolation

position = [0 0.5 1.0 1.5 2.0 3.0 3.5 4.0];  %Original Position x values
dosage = [1.90 2.39 2.71 2.98 3.20 3.20 2.98 2.74]; %Original Dosage y values

%==========
%Here we use all 8 values to find an interpolant for degree 7.
%x = [0; 0.5; 1.0; 1.5; 2.0; 3.0; 3.5; 4.0]; 
%y = [1.90; 2.39; 2.71; 2.98; 3.20; 3.20; 2.98; 2.74];

%However, we later realize that more points do not usually help us obtain a
%missing point around a specific section. We reduce the points to 4 around
%the x = 2.5 which is where we would like our interpolant to work the best
%==========

%The 4 values near 2.5 used to interpolate for a polynomial of degree 3.
x = [1.5; 2.0; 3.0; 3.5]; 
y = [2.98; 3.20; 3.20; 2.98];

n = length(x);
V = ones(n,n); %Matrix for x^0, x^1, x^2 .... for Vandermonde matrix

for j = 2:n
    for i = 1:n
        V(i,j) = x(i).*V(i,j-1); %Vandermonde method for coefficients. This build V matrix
    end
end

a = V\y; %Coefficients in vector a. 

%==========
%Here we have the interpolant of degree 7 which uses all give points in the
%table.

%interpolant7  = a(1) + a(2)*x + a(3)*x.^2 + a(4)*x.^3+ a(5)*x.^4 + a(6)*x.^5 + a(7)*x.^6 + a(8)*x.^7;

%However, we get 3.2907 as the missing Dosage value. We would like to know
%if we can do better with a degree 3 interpolant.

%degree7  = a(1) + a(2)*2.5 + a(3)*2.5^2. + a(4)*2.5.^3+ a(5)*2.5.^4 + a(6)*2.5.^5 + a(7)*2.5.^6 + a(8)*2.5.^7;
%==========

%Interpolant function of degree 3 obtained by using 4 points near 2.5
interpolant3 = a(1) + a(2)*x + a(3)*x.^2 + a(4)*x.^3;

%The value obtained below is 3.2733 
degree3 =  a(1) + a(2)*2.5 + a(3)*2.5^2. + a(4)*2.5.^3;

%CONCLUSION: We reach the conclusion that the interpolant obtained by
%really close points is better than one that uses many points but fails to
%interpolate the  specific values we would like to see. In this case, the
%interpolant of degree 3 is better than the one of degree 8 because when we
%evaluate a 2.5, degree 3 gives us 3.2733 while degree 7 gives us 2.2907.
%The degree 3 value is closests to the actual value since we used 4 points
%near 2.5 to interpolate. 