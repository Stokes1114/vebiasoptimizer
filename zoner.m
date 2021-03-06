ZONE=zeros(size(RPM));
MAPboundry= [0 30 45 60 75 90 105]; %7 elements
RPMboundry= [0 1000 1750 2500 3250 8000]; %6 elements
for ri=1:length(RPMboundry)-1   %start on lower boundry, stop one short 
    for mi=1:length(MAPboundry)-1
        RPMlo= RPMboundry(ri);
        RPMhi= RPMboundry(ri+1);
        MAPlo= MAPboundry(mi);
        MAPhi= MAPboundry(mi+1);
        ZONE(RPM > RPMlo & RPM <= RPMhi & MAPkpa > MAPlo & MAPkpa <= MAPhi)= (ri-1)*(length(MAPboundry)-1)+mi;
    end
end

% for ri=1:length(RPMboundry)-1   %start on lower boundry, stop one short
%     for mi=1:length(MAPboundry)-1
%         RPMlo= RPMboundry(ri);
%         RPMhi= RPMboundry(ri+1);
%         MAPlo= MAPboundry(mi);
%         MAPhi= MAPboundry(mi+1);
%         disp([RPMlo RPMhi MAPlo MAPhi ((ri-1)*(length(MAPboundry)-1)+mi)]);
%     end
% end

clear MAPboundry RPMboundry mi ri MAPlo MAPhi RPMlo RPMhi;