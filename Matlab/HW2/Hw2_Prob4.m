%[4] MidPoint Temperatures Interpolation. 

%Original Temperature values
T = [300 400 500 600 700 800 900 1000 1100 1200 1300 1400 1500 1600 1700 1800 1900 2000];
%Tungsten emitance
e = [0.024; 0.035; 0.046; 0.058; 0.067; 0.083; 0.097; 0.111; 0.125;
    0.140; 0.155; 0.170; 0.186; 0.202; 0.219; 0.235; 0.252; 0.269];

%Midpoint temperature values
midT = [350 450 550 650 750 850 950 1050 1150 1250 1350 1450 1550 1650 1750 1850 1950];
%Results from midpoint temperatures using the correlation formula
midEcorrelated = (0.02424)*((midT) ./ 303.16).^1.27591;
%Matrix for midEcorrelated (used for calculations purpose)
midEcorrelatedM = [0.0291168562318816; 0.0401238873158017; 0.0518320973674277; 0.0641456048341879;0.0769949143475192;
                 0.0903269872558974; 0.104099812873823; 0.118279168338481; 0.132836555329035; 0.147747818867170; 0.162992185159864; 
                 0.178551569201945; 0.194410062831653; 0.210553547437781; 0.226969395154558; 0.243646234365160; 0.260573762906763];

n = length(midT);
V = ones(n,n); %Vandermonde matrix

for j = 2:n
    for i = 1:n
   V(i,j) = midT(i).*V(i,j-1); %Builds Vandermonde matrix
    end
end

a = V\midEcorrelatedM; %a is the vector of coefficients for the interpolant

%We have decided to find the interpolant that uses all given points. This
%means we have 17 (a) coefficients. 

%Interpolant17 saves the e values for all midT or midtermperature values. 
interpolant17  = a(1) + a(2)*midT + a(3)*midT.^2 + a(4)*midT.^3+ a(5)*midT.^4 + a(6)*midT.^5 + a(7)*midT.^6 + a(8)*midT.^7 + a(9)*midT.^8 + a(10)*midT.^9+ a(11)*midT.^10 + a(12)*midT.^11 + a(13)*midT.^12 + a(14)*midT.^13 + a(15)*midT.^14 + a(16)*midT.^15 + a(17)*midT.^16;

%Here we use our interpolant with the orginal temperatures. 
interpolantWithOriginalVals  = a(1) + a(2)*T + a(3)*T.^2 + a(4)*T.^3+ a(5)*T.^4 + a(6)*T.^5 + a(7)*T.^6 + a(8)*T.^7 + a(9)*T.^8 + a(10)*T.^9+ a(11)*T.^10 + a(12)*T.^11 + a(13)*T.^12 + a(14)*T.^13 + a(15)*T.^14 + a(16)*T.^15 + a(17)*T.^16;

difference = interpolantWithOriginalVals - e; %We hope that our interpolant will give us the same original e values for 
%the original temperatures. That means this difference should apprach 0 and
%it does for most values. 

%========
%The degree needed to interpolate the midpoints of temperature according to
%their correlation is 17. 

%Pros: Using interpolation might match the values in between the intervals
%this means that we do get values for points really close to each other while the
%correlation formula would simply give us almost the same values for close points.

%Cons: Interpolation with big degree polynomials or using many points to
%interpolate will lose precision if the range is large. While the
%correlation is close to the actual values or has better precision than big
%polynomials at their tail points.