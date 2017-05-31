function lat = findMyMeridian(zone)


if ((zone>0) && (zone<=30))
    lat = 177-(zone-1)*6;
end

if ((zone>30) && (zone<=60))
    lat = 177 - (60-zone)*6;    
end

end