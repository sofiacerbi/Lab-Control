s = tf('s');
MotorCD = 14.87/(s+10.4);

%controlSystemDesigner(MotorCD)
%sisotool('rlocus',MotorCD)

CC = tf(C)
num = cell2mat(CC.numerator);
den = cell2mat(CC.denominator);
[ki,~,kp] = residue(num,den)
