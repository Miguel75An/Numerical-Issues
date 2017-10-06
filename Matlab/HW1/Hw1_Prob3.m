% Problem[3] 

%[a] Produce a plot for the system (B,t,L,U) = (2,3,-2,3)
% Also, calculate the rounding unit for this modest floating point system.

%To do this we need to generate all the numbers in the given floating point
%system. To do this we need two for loops and and each iteration we save
%those numbers to a vector x

%WARNING: Running the code might take a lot of time

x = zeros(1,6000); %Our floating point system has about 6000 numbers
increase = 0.001;  %We increase our numbers by this amount each iteration
i = 1;             %i is a counter for the index of array x

for exp = -2:3          %Range of exponets for given system
    increase = 0.001;    %Reset increase after we change exponent
    for mant = 1:999    %Run loop 999 times
        x(1,i) = increase.*2.^exp;   %Save number to array x
        increase = increase + 0.001; %Increase + 0.001
        i = i + 1;                    %Move index +1
    end
end

y = zeros(1,length(x));  %Fill vector y with zeros
plot(x,y,'+')           %Plot

%The rounding unit for this floating point system can be calculate with the
%followng formula: n = (1/2)(2^-t) where n is the rounding unit and t is
%the number of decimal places the mantisa has. Therefore our floating point
%system has n = (1/2)*(2^-3) = 2^-4

%Explanation of the graph: As we have discussed in class, most numbers are
%packed in the left side of the graph since they are the smallest ones and
%their spacing is so little. As the exponent increases in our system, we
%notice that bigger numbers are far away from each other with a larger
%spacing. We can conclude that floating point representations can hold
%really small numbers with an almost insignificant difference between them
%and they can also hold large numbers with significant differences. 

%Please zoom in in the graph to notice the spacing between the numbers. 