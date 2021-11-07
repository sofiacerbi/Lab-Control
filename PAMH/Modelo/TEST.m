M_profe = tf([0.6236],[1, 0.149, 0.9413]);

M_profe = tf([0.6236],[1, 0.149, 0.9413]);

M = tf(MODELO1*1.15);
num = cell2mat(M.numerator);
den = cell2mat(M.denominator);
M_PAMH = tf(num,den,'InputDelay',1.26);

plot(Tiempo,ANGULO_E,'Color',[1,0,0])
hold on;

opt = stepDataOptions('StepAmplitude',0.8,'InputOffset',-0.113);
%step(M_profe,'b',opt)
%hold on;
step(M_PAMH,'g',opt)
