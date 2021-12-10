clear;
PIDdesign;

%% PID
GPI = tf([Ti*k k], [Ti, 0]);
GD = tf([k*Td 0], 1);
GPID = GPI+GD;

%% Filtret
GF = tf([0 1], [Tf 1]);

%% Regulatorn
GR = GPID*GF;

%% Kretsöverföringsfunktionen
GK = GR*GP;

GTOT = (GPI*GP)/(1+GPI*GP*GF*GF+GP*GD*GF);

H = [2.5 5.4 6.9 8.2 9.6 13.1 15.5];  
Y = [0.10 2.33 3.43 4.49 5.54 8.22 9.91];