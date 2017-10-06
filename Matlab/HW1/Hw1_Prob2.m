% Problem[2] 

%[a] Derive f2(a,b)
[a,b] = meshgrid(-500:50:500); %The meshgrid defines a 3d Box where each square occupies 50 units
f1 = sin(a + b) - sin(a);      %f1 is our original function
f2 = (2).*(cos(a + (b/2))).*sin(b/2); %f2 equivalent to f1 thanks to the trigonometric formula

%[b] Suggest a formulat that avoids cancellation of errors for computing
%the derivative. Write a MATLAB script that implements the formula and
%computes f'(1.2) for h = 1e-20,1e-19...1

%We will use the given trigonometric formula in order to obtain the derivative
%for sin(x)

x = 1.2;    %Value 1.2 for x which will be used with the derivative  
h = 10.^(-20:0); %h ranges from 1e-20 up to 1

%The following is the derivative using f1 which might produce cancelation
%errors at the numerator.
dev1 = (sin(x+h) - sin(x))./ h;
%The next is the derivative using f2 which avoids the cancelation of erros
dev2 = (2).* cos(x + (h/2)) .* sin(h/2) ./ h;

%If we take a look at the 7 first numbers in dev1 we have:
% [0,0,0,0,0,0.444089209850063,0.366373598126302]
%Clearly we exprienced cancelation errors since the numerator became
%zero when we substracted two almost idential numbers.

%If we take a look at the 7 first numbers in dev2 we have:
%[0.362357754476674,0.362357754476674,0.362357754476674,0.362357754476674,
% 0.362357754476674,0.362357754476673,0.362357754476669]
%We have improved the derivative of sin(x) by redefining the formula with
%ours and therefore obtain better results for the derivative values. AND
%AVOID CANCELLATION ERRORS

