%% Definición de variables de estado
A=[0 0 1 0; 0 0 0 1;0 0 -17.46 0;0 -35.26 0 -0.02444];
B=[0;-0.37029;0.42144;-0.392];
C =[1 0 0 0]; %Sistema SISO


%% Variables sistema aumentado
As = [A [0;0;0;0];-C 0];
Bs =[B;0];

%% Por LQR
Q = eye(5);
Q(1,1) = 500;
Q(3,3) = 500;
R = 1;
KsLQR = lqr(As, Bs, Q, R);
KLQR = KsLQR(1:4);
KiLQR = -KsLQR(5);
eig(As-Bs*KsLQR);

%% Por ubicación de polos
P = [-1.15+0.18i -1.15-0.18i -4 -6 -8];
KsUP = place(As, Bs, P);
KUP = KsUP(1:4);
KiUP = -KsUP(5);

