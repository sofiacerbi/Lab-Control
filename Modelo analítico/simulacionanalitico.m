%Declacarión de las constantes a utilizar
Ra=0.5;
La=0.0015;
kb=0.03;
kb=0.03;
km=0.03;
Bm=0.2;
Jm=0.00025;
kt=0.75;
m1=0.5;
m3=1;
mt=4.5;
L1=0.4;
g=9.81;
beta=0.01;

%Sustituciones necesarias para simplificación
alpha=kt*kb/mt*L1^2;
delta=g*(m1-m3)/mt*L1;

%Definición del sistema matricial de las ecuaciones de espacio de estado
A=[-Ra/La -kb/La 0 0; km/Jm -Bm/Jm 0 0; 0 0 0 1; 0 alpha delta -beta/(mt*L1)];
B=[1/La; 0;0;0];
C=[0 0 1 0];
D=[0];

%Creación de nuestra repretación matricial
sysss=ss(A, B, C, D);

%Simulación para obtener la respuesta ante el escalón e impulso
step(sysss);
%%%impulse(sysss)