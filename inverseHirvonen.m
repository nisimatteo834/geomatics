function [fi,lambda] = inverseHirvonen(east,north,zone)

central_meridian = findMyMeridian(zone)

mc = 0.9996;
y = north/mc;
falseEast = 500000;
x = (east - falseEast)/mc;
a = 6378137;
c = 6356752.314245;
esquare = (a^2 - c^2)/a^2;
A1 = 1-esquare/4 - 3*esquare^2/64 - 5*esquare^3/256;


theta = y/a/A1;
e1 = (a-c)/(a+c);
b2 = 3*e1^2/2-27*e1^3/32;
b4 = 21*e1^2/16-55*e1^4/32;
b6 = 151*e1^3/96;
b8 = 1097*e1^4/512;
csi = theta + b2*sin(2*theta)+b4*sin(4*theta)+b6*sin(6*theta)+b8*sin(8*theta);

efirstsquare = (a^2 - c^2)/c^2;
ni = sqrt(1+efirstsquare*((cos(csi))^2));

Rp = a^2/c;
lambdafirst = atan(ni*sinh(x/Rp)/cos(csi));
fi = atan(tan(csi)*cos(lambdafirst*ni));
lambda = lambdafirst + central_meridian;


end
