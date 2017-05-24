close all
clear all
clc 

lambda = 45.06336;
phi = 7.661279;

a = 6378137;
f = 1/298.257223;
e_squared = 2*f - f^2;
W = sqrt(1-e_squared*((sind(phi))^2));

X = a*cosd(phi)*cosd(lambda)/W;
Y = a*cosd(phi)*sind(lambda)/W;
Z = a*(1-e_squared)*sind(phi)/W;

Xsat = 15487292.829;
Ysat = 6543538.935;
Zsat = 20727274.429;


Matrix = [-sind(lambda),cosd(lambda),0;
          -sind(phi)*cosd(lambda), -sind(phi)*sind(lambda), cosd(phi);
          cosd(phi)*cosd(lambda), cosd(phi)*sind(lambda), sind(phi)];

Vector = [Xsat - X; Ysat - Y; Zsat - Z];

Local = Matrix * Vector;

e = Local(1) %Is there any correlation btw this e and e_sqaured?
n = Local(2)
u = Local(3)

az = atand(u/sqrt(n^2+e^2))
elev = atand(e/n)

