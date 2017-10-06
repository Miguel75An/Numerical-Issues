% Problem[1] 

% [a] Derive f2(x,y)
[x,y] = meshgrid(-500:50:500); %The meshgrid defines a 3d Box where each square occupies 50 units
f1 = cos(x + y) - cos(x);      %f1 is our original function
f2 = (-2)*(sin(x + (y/2))).*sin(y/2); %f2 equivalent to f1 thanks to the trigonometric formula

% [b] Write a MATLAB script which will calculate g1(x,y) and g2(x,y)
%     for x = 3 and y = 1.e-11

argX = 3;     %Arguments for g1 and g2
argY = 1e-11;
%Functions g1 and g2 with arguments x and y.
g1Result = (cos(argX + argY) - cos(argX))/argY + sin(argX); 
g2Result = (-2*sin(argX + (argY/2)).*sin(argY/2))/argY + sin(argX);
%We obtain -4.406002364343298e-07 as g1Result 
%and 4.949957110866876e-12 as g2Result 

% [c] Explain the difference in the results of the two calculations
%The different results were producted by the floating point representation
%of numbers. For example, the function g1(3, 1e-11) can be decomposed into
%two terms which are  -0.141120448660104 + 0.141120008059867 MATLAB has a
%mantissa long enough to consider the smallest decimal places and saves that
%little result which turns out to be negative or -4.406002364343298e-07

%In the other side, g2(3, 1e-11) can be decomposed into the two terms 
%-0.141120008054917 + 0.141120008059867. NOTICE that the 7th and later
%decimal places are different from g1. The right side is the same number as
%before but the answer we obtain is positive since the two numbers are
%almost equal but they do differ at their smallest decimal places. We
%obtained 4.949957110866876e-12

%To summarize, MATLAB keeps the decimal places as much as it can until it
% can no longer keep the mantissa limits. Then we might get cancelation
% errors where two almost identical numbers and substracted and a zero
% value is given because of the lack of precision and the lack of decimal
% representation. 

