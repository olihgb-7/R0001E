% Indata till designalgoritm: Önskad
% * Överkorsningsfrekvens (wc [rad/s])
% * Fasmarginal (Phim [rad])
% * Högfrekvensförstärkning (K8)
% samt processens 
% * Förstärkning i wc (absGPwc)
% * Fasvridning i wc (phiGPwc [rad])

%% Designparametrar
wc = 0.09;
Phim = 65*(pi/180);
K8 = 4.5;

%% Processparametrar
K1 = 5.41;
K12 = 0.911;
T1 = 31.645;
T2 = T1;

%% Processens överföringsfunktion
G1 = tf([0 K1],[T1 1]);
G12 = tf([0 K12],[T2 1]);
GP = G1*G12;

%% Amplitudfunktion
absG1wc = K1/sqrt(1+(T1*wc)^2);     %%abs(K1/(T1*wc*i + 1))
absG12wc = K12/sqrt(1+(T2*wc)^2);   %%abs(K12/(T2*wc*i + 1))
absGPwc = absG1wc*absG12wc;

%% Fasfunktion
phiG1wc = -atan(T1*wc);
phiG12wc = -atan(T2*wc);
phiGPwc = phiG1wc+phiG12wc;

%% Designalgoritm
PhiR=-phiGPwc-pi+Phim;
my=K8*absGPwc;
Storre_an_1=my*cos(PhiR)
% Regulatorparametrar
Td=(sqrt(my*(my-cos(PhiR)))+my*sin(PhiR))/(2*wc*(my*cos(PhiR)-1))
Tf=Td*cos(PhiR)/(my+wc*Td*sin(PhiR))
Ti=4*Td
k=K8*Tf/Td