%the ellipsoid is wgs84
%on x and y we need to apply a modulus of .... to use not a tangent but a secant cil. 
%false east i 500 km


latdecp1 = dms2degrees([45 3 45.717]);
longdecp1 = dms2degrees([7 47 26.292]);
latrad1 = fromGradToRad(latdecp1);
longrad1 = fromGradToRad(longdecp1);

latdecp2 = dms2degrees([38 32 34.649]);
longdecp2 = dms2degrees([16 50 06.493]);
latrad2 = fromGradToRad(latdecp2);
longrad2 = fromGradToRad(longdecp2);

[east_P1,north_P1] = hirvonen(latrad1,longrad1,fromGradToRad(9),32)
[east_P2,north_P2] = hirvonen(latrad2,longrad2,fromGradToRad(15),33)


%final value are expressed in meters. 
%if you put a value that has the same distance from the central meridian .



