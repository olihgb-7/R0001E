GP = tf(0.6,[10 1]);        %% Bilens överföringsfunktion
GR = tf([20*2.5 20], [2.5 0]);  %% Farthållarens överföringsfunktion

GK = GP*GR;                   %% Kresöverföringen
GTOT= GK/(1+GK);            %% Sevosystemets överföringsfunktion GTOT = tf([200 100 8], [10 13 4.8]);

TI_test = 9;
GR1 = tf([20*TI_test 20], [TI_test 0]);
GK1 = GP*GR1;
GTOT1 = GK1/(1+GK1);