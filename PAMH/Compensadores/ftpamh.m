s=tf('s');
PAMH=11.321/(s^2+0.2929*s + 17.34);
sisotool('rlocus', PAMH);

%CompIMC
%syms KP KI KD N S
%PID = KP + KI/S + S*KD*N/(S+N)
%collect(PID)
%tf(CompIMC)
%[num, den]=tfdata(CompIMC,"v")
%N=den(2)
%KI = num(3)/N
%KP = (num(2)-KI)/N
%KD = (num(1)-KP)/N
%PIDs = KP + KI/s + s*KD*N/(s+N)
%zpk(PIDs)