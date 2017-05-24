close all
clc

phi = 45.06333;
lambda = 7.661389;

a = 6378137;
f = 1/298.257223;
e_squared = 2*f - f^2;
W = sqrt(1-e_squared*((sind(phi))^2));

X = a*cosd(phi)*cosd(lambda)/W;
Y = a*cosd(phi)*sind(lambda)/W;
Z = a*(1-e_squared)*sind(phi)/W;

Matrix = [-sind(lambda),cosd(lambda),0;
          -sind(phi)*cosd(lambda), -sind(phi)*sind(lambda), cosd(phi);
          cosd(phi)*cosd(lambda), cosd(phi)*sind(lambda), sind(phi)];

Sats = [22504974.806 13900127.123 -2557240.727;
              -3760396.280 -17947593.853 19494169.070;
              9355256.428 -12616043.006 21189549.365;
              23959436.524 5078878.903 -10562274.680;
              10228692.060 -19322124.315 14550804.347;
              23867142.480 -3892848.382 10941892.224;
              21493427.163 -15051899.636 3348924.156;
              14198354.868 13792955.212 17579451.054;
              18493109.722 4172695.812 18776775.463;
              -8106932.299 12484531.565 22195338.169;
              8363810.808 21755378.568 13378858.106];

size_sat = size(Sats,1);
ro = ones(1,size_sat);
D = ones(size_sat,4);
D(:,4) = -1*ones(size_sat,1);

for i = (1:size_sat)
    ro(i)= sqrt((Sats(i,1)-X)^2+(Sats(i,2)-Y)^2+(Sats(i,3)-Z)^2);
    D(i,1) = (Sats(i,1)-X)/ro(i);
    D(i,2) = (Sats(i,2)-Y)/ro(i);
    D(i,3) = (Sats(i,3)-Z)/ro(i);
end

Qxx = inv(D'*D);
Qxxstar = (Qxx(1:3,1:3));
Quu = Matrix * Qxxstar * Matrix';

HDOP = sqrt(Quu(1,1)+Quu(2,2))
PDOP = sqrt(trace(Quu))
GDOP = sqrt(trace(Quu)+Qxx(4,4))
    
    
    




