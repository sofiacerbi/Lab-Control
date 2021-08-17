%% Definición de variable y de función de transferencia
s = tf('s');
MotorCD = 14.87/(s+10.4);

%% Diseño del controlador, descomentar a conveniencia
controlSystemDesigner(MotorCD)
%sisotool('rlocus',MotorCD)

%% Definición del modelo paralelo
CC = tf(C)
num = cell2mat(CC.numerator);
den = cell2mat(CC.denominator);
[ki,~,kp] = residue(num,den) %variables del modelo paralelo