%[2] Interpolation Questions

% for i = 0:3
%     Nx = 10*3^i;
%     dx = 1/Nx;
%     x = [1:dx:2]';
%     
%     V = vander(x);
%     C = V\sin(x);
%     
%     y = x+0.1*dx*rand(size(x));
%     subplot(2,2,i+1)
%     plot(y,polyval(C,y)-sin(y))
%     xlabel('x')
%     ylabel('Pn(x)-f(x)')
%     title(['Nx = ',num2str(Nx)])
% end
% figure(gcf);

%[a] The absolute error for the problem at hand is |sin(x)-P(x)|. If this
%were always zero, that would gurantee exact interpolation for any n.
%However, we need to increase the number n in order to apprach 0.
%Eventually, the difference between the original sin(x) funciton and the
%interpolant P(x) will become 0. Why? Well first it is important to mention
%that we are working on a small range. The range is small enough for the
%interpolant to actually match the original function at that SMALL part
%only. So therefore, in this small [0 2] range the interpolant and the
%original function difference is eventually zero the more points n we have.

%[b] YES! Taking a look at all four graphs we notice that we can see a
%straight line in the middle for all of them. The straigh line says that
%indeed the interpolant and the original function are giving us the same
%value and the more we increase the degreee n the more straight the line
%is in the small interval.

%[c] Larger n is good only in small intervals because we eventually
%interpolate that specific small section for the function at hand. HOWEVER,
%increasing n or the degree of interpolation is bad if we want to test
%values far away or at the tails of a large interval. Example, testing the
%interpolant at x = 100 or  x = -100 when the interpolant only used more
%points in the range of [-5 to 5]. This can also be seen in the graphs we
%generated where at the beginning and end the straight line rises quickly
%since the interpolant degree is too big or just gives us the wrong values
%or produces a big error gap from the original function.

%[d] The source of the problem with large (n) are the points we are using
%to interpolate and the range where they are located. If they are uniformly
%distributed or their spacing is good enough then we can get something more
%precise but if that is not the case then we won't get a good interpolation
%with points far away form each other. 