b = 5100; %%8850   5100
k_f = 98230;
k_d = 982300;
m = 1200/4;
m_0 = 50;

G1 = tf([0 b k_f], [m b k_f]);
G2 = tf([0 b k_f], [m_0 b k_f+k_d]);
G3 = tf([0 0 k_d], [m_0 b k_f+k_d]);

K = minreal((G1*G3)/(1-G1*G2));

s = tf('s');
G = s^2;
K2 = K*G;

t = 0:0.01:2;
v = 0.1*sin(30*t);


