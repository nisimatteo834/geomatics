close all
clear all



i = 1;
m = NaN*ones(1,length(0:0.5:3));

fi = [30 37 45 60];


for index = 1:length(fi)
    i = 1;
    for lambda = 0:0.5:3
    fiInRad = fromGradToRad(fi(index));
    m(i) = 0.9996*(1+((lambda)^2)/2*(cos(fromGradToRad(fi(index)))^2));
    i = i+1;
    end
    figure
    plot(0:0.5:3,m)
    grid on
    string = strcat('phi = ',int2str(fi(index)));
    title(string);
end

when you increase latitude the deformation decrease.
It is bigger at the eqautor.
The final conclusion is that you need to be careful.
If you measure the distance and it is 10m maybe your real distance is smaller or biggher than 10 km.


