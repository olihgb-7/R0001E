% Indata till designalgoritm: �nskad
% * �verkorsningsfrekvens (wc [rad/s])
% * Fasmarginal (Phim [rad])
% * H�gfrekvensf�rst�rkning (K8)
% samt processens 
% * F�rst�rkning i wc (absGPwc)
% * Fasvridning i wc (phiGPwc [rad])

PhiR=-phiGPwc-pi+Phim;
my=K8*absGPwc;
Storre_an_1=my*cos(PhiR)
Td=(sqrt(my*(my-cos(PhiR)))+my*sin(PhiR))/(2*wc*(my*cos(PhiR)-1))
Tf=Td*cos(PhiR)/(my+wc*Td*sin(PhiR))
Ti=4*Td
k=K8*Tf/Td