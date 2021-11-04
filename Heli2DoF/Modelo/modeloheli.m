s=tf('s');
yaw = -0.049458/(s*(s+0.06447));
py  = 0.011/s;
pitch = 0.035583*(s+1.423)/(s^2+0.7304*s+1.554);

pitchss=ss([0 1;-1.554 -0.7304],[0;1],[0.05063 0.035583],0);
pitchob=canon(pitchss,'companion');%forma canonica obsv
pitchctrl=pitchob;
pitchctrl.a=pitchob.a';
pitchctrl.b=pitchob.c';
pitchctrl.c=pitchob.b';

Acomplt=[0 0 1 0; 0 0 0 1;-1.554 0 -0.7304 0;0 0 0 -0.06447];
Bcomplt=[0.03558 0;0.011 0;0.02464 0;0 -0.049458];
Ccomplt=[1 0 0 0;0 1 0 0];
helic=ss(A,B,C,0);
helitf=zpk(helic);
