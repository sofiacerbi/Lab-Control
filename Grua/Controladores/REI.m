%% Definición de variables de estado
A =[0 0 1 0; 0 0 0 1; 0 0 -17.46 0; 0 -35.32 0 -0.03405];
B =[0; -0.40979; 0.42144; -0.4941];
C =[1 0 0 0]; %Sistema SISO

%% Variables sistema aumentado
As = [A [0;0;0;0];-C 0];
Bs =[B;0];

%% Por LQR
Q = eye(5)*100;
Q(1,1) = 500;
R = 1;
Ks = lqr(As, Bs, Q, R);
K = Ks(1:4);
Ki = -Ks(5);
eig(As-Bs*Ks);

%% Por ubicación de polos
P = [-0.55+0.48i -0.55-0.48i -15 -14 -13];
KsREI = place(As, Bs, P);
KREI = KsREI(1:4);
KiREI = -KsREI(5);

