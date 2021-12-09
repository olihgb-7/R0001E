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

GTOT = (GPI*GP)/(1+GPI*GP*GF^2+GP*GD*GF);