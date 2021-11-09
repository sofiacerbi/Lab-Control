%% Definición de variables de estado
A=[0 0 1 0; 0 0 0 1;-1.554 0 -0.7304 0;0 0 0 -0.06447];
B=[0.03558 0;0.011 0;0.02464 0;0 -0.049458];
C=[1 0 0 0;0 1 0 0];

%% Variables sistema aumentado
As = [A [0;0;0;0] [0;0;0;0]; -C [0 0; 0 0]];
Bs = [B; 0 0; 0 0];

%% Por LQR
Q = eye(6);
Q(1,1) = 100;
Q(2,2) = 100;
Q(3,3) = 100;
Q(4,4) = 100;
Q(5,5) = 1900;
Q(6,6) = 100;
R = 2;

KsLQR = lqr(As, Bs, Q, R);
KLQR = KsLQR(:,1:4);
KiLQR = -KsLQR(:,5:6);

[V,D] = eig(As-Bs*KsLQR);
polosLQR = diag(D);

%% Por ubicación de polos
polosUP = [-0.445+0.112i -0.445-0.112i -1.4 -1.5 -1.6 -1.7];
KsUP = place(As, Bs, polosUP);
KUP = KsUP(:,1:4);
KiUP = -KsUP(:,5:6);
