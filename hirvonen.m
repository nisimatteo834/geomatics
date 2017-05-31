function [east,north] = hirvonen(lat,long,central)

phi = lat;
lambda = long;

a = 6378137;
c = 6356752.314245;
e = 1/298.257223563;
efirstsquare = (a^2 - c^2)/c^2;
Rp = a^2/c;
lambdafirst = lambda - central;
nifirst = sqrt(1+efirstsquare*(cos(phi))^2);
csi = atan(tan(lat)/cos(nifirst*lambdafirst));
ni = sqrt(1+efirstsquare*(cos(csi))^2);

esquare = (a^2 - c^2)/a^2;

A1 = 1-esquare/4 - 3*esquare^2/64 - 5*esquare^3/256;
A2 = 3*esquare/8 + 3*esquare^2/32 + 45*esquare^3/1024;
A4 = 15*esquare^2/256 + 45*esquare^3/1024;
A6 = 35*esquare^3/3072;

mc = 0.9996;

x = Rp * asinh(cos(csi)*tan(lambdafirst)/ni);
y = a * (A1 * csi - A2 * sin(2*csi) + A4*sin(4*csi) - A6 * sin(6*csi));

falseEast = 500000;
east = x*mc + falseEast;
north = y*mc;

   

end
