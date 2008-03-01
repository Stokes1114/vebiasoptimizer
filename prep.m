format compact
format short g
% global DYNAIRgsec IATk ECTk MATk CAM0 paramVEcomponents MAPkpa RPM GMVE
global DYNAIRgsec IATk ECTk MATk paramVEcomponents MAPkpa CAM0 CAM1 CAM1s CAM2s CAM2 CAM3 GMVEhat IPW1 IFRgsec AFR AFRwb coefs BIASexpc FILTERexpc ZONE SPEEDkmh TEMPc TEMPd weights
% load
% ECTk=ECTc+273.15;
% IATk=IATc+273.15;
% MATk=MATc+273.15;
% clear CAM1c CAM2c TEMPc BIASexpc FILTERexpc TEMPd ECTc IATc;
lb=[0 0 -1 0 -1]; ub=[1 4 1 1 1];
startx=[1E-4	0.1	0.01	7E-4	0.02];
ZONE=zeros(size(RPM));
weights= zeros(size(CAM0));
zoner
coefs=zeros(6,max(ZONE));
paramVEcomponents= x2fx([MAPkpa,RPM],'quadratic');
CAM2= CAM2gen(AFRwb, IPW1, IFRgsec);

BIASexpc= BIASexp(startx(1), startx(2), startx(3), DYNAIRgsec, SPEEDkmh);
TEMPc= TEMPbias(IATk, ECTk, BIASexpc);

FILTERexpc= FILTERgenerator(startx(4), startx(5), DYNAIRgsec);
TEMPd= TEMPfiltering(TEMPc, MATk, FILTERexpc);

[p, s, mu]= polyfit(MAFhz,DYNAIRgsec,3);
[MAFhat, MAFd]= polyval(p,MAFhz,s,mu);
CAM1= CAM1gen(MAFhat, RPM, 8);