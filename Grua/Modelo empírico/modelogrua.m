s=tf('s');
pos=0.42144/(s*(s+17.46));
pos=zpk(pos);
poss=ss([0 1;0 -17.46],[0;0.42144],[1 0],0);
%ang=-0.40979*(s+1.24/s^2+0.03405*s+35.32);
ang=-0.37029*(s+1.083/s^2+0.02444*s+35.26);
ang=zpk(ang);
%angs=ss([0 1;-35.32 -0.03405],[0;1],[-0.5081 -0.40979],0);
angs=ss([0 1;-35.26 -0.02444],[0;1],[-0.40102407 -0.37029],0);
angs1=canon(angs,'companion');%forma canonica obsv
angs.a=angs1.a';
angs.b=angs1.c';
angs.c=angs1.b';
A=[0 0 1 0; 0 0 0 1;0 0 -17.46 0;0 -35.26 0 -0.02444];
B=[0;-0.37029;0.42144;-0.392];
C=[1 0 0 0;0 1 0 0];
grua=ss(A,B,C,0);
zpk(grua);
Mx=[A B;-[1 0 0 0] 0];
As= [A [0;0;0;0];-[1 0 0 0;] 0];
Bs=[B;0];
%Q=eye(5)--->1:pos 2:ang 3:velline 4:velang 5:estinte
%R=1
%Ks=lqr(As,Bs,Q,R)
%K=Ks(1:4)
%Ki=-Ks(5)
%eig(As-Bs*Ks) ---->para ver los polos, ayuda para REI
