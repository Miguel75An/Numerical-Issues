%Problem[4]

%[a] Which of the two methods to calculate the variance is cheaper in terms
%of flop counts?

%Answer: The first (original) sample variance formula needs to deal with
%10,000 subtractions and 10,000 multiplications (when we square). Then we
%need to sum for 10,000 times and we divide at the end. In total this
%formula gives us 30,000 flop counts every time an operation is done. 

%For the second (rewritten) variance formula, we square 10,000 times and
%sum 10,000 times and then divide once. Finally, we substract with a number
%which is fixed. In total we have about 20,000 flop counts which is faster
%than the previous formula.

%In conclusion, the second formula does less operations and is faster and
%cheaper. 

%[b] Which of these two methods is expected to give more accurate results
%for variance in general? 

%Answer: The second varaince formula would give us more accurate results
%since we only do one subtraction at the end, instead of substracting the
%sample mean every time for 10,000 values. When we subtract a lot of times
%we might encounter cancelations errros, and image the case where the
%sample mean is close to all those values. In the second method, we first
%square and sum which gives us more accurate decimal numbers for floating
%points and at the end we subtract by the fixed mean. 

%[c] Write a MATLAB script to check your answer

n = 10000;
randv = randi([10 50], 1,10000); %Generate 10,000 Random Numbers
randscale = randv.*0.00001;      %Readjust to get floating point numbers
mymean = mean(randscale);        %Find the mean of 10,000 numbers

%first sample variance formula
squares1 = (randscale - mymean).^2;
sum1 = sum(squares1);
variance1 = sum1/n;        %Result of first formula

%second sample variance formula
squares2 = (randscale).^2;
sum2 = sum(squares2);
div = sum2/n;
variance2 = div - (mymean^2);  %Result of first formula

%For example, for a given instance the variance1 is 1.385156879099989e-08
%while variance2 is  1.385156879099573e-08 the last decimal places are
%different but this is very important when we are dealing with large
%numbers since we would like more accurate results, we can see that
%variance2 offers a more accurate answer. 
