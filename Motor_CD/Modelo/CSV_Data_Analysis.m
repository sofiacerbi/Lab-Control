%% Import data from text file
% Script for importing data from the following text file:
%
%    filename: C:\Users\sofia\OneDrive - Estudiantes ITCR\TEC\2021\Segundo Semestre\Lab de Control\Motor CD\MotorCD_Experimento12Agosto2021_Gr2.csv
%
% Auto-generated by MATLAB on 13-Aug-2021 19:11:48

%% Set up the Import Options and import the data
opts = delimitedTextImportOptions("NumVariables", 4);

% Specify range and delimiter
opts.DataLines = [3, Inf];
opts.Delimiter = ",";

% Specify column names and types
opts.VariableNames = ["Tiempo", "CORRIENTE", "VELOCIDAD", "ENTRADA"];
opts.VariableTypes = ["double", "double", "double", "double"];

% Specify file level properties
opts.ExtraColumnsRule = "ignore";
opts.EmptyLineRule = "read";

% Specify variable properties
opts = setvaropts(opts, ["Tiempo", "CORRIENTE", "VELOCIDAD", "ENTRADA"], "FillValue", 0);

% Import the data
tbl = readtable("C:\Users\sofia\OneDrive - Estudiantes ITCR\TEC\2021\Segundo Semestre\Lab de Control\Lab-Control\Motor_CD\Modelo\MotorCD_Experimento12Agosto2021_Gr2.csv", opts);

%% Convert to output type
Tiempo = tbl.Tiempo;
CORRIENTE = tbl.CORRIENTE;
VELOCIDAD = tbl.VELOCIDAD;
ENTRADA = tbl.ENTRADA;

%% Clear temporary variables
clear opts tbl

%% Definición de un objeto llamado MOTOR
deltaT = Tiempo(2)-Tiempo(1);
Motor = iddata([VELOCIDAD, CORRIENTE], [ENTRADA], deltaT);
Motor.inputname = {'ENTRADA'};
Motor.outputname = {'VELOCIDAD';'CORRIENTE'};

%% Obtención de los modelos
Modelo1 = zpk(M1);
modelovelocidad1 = Modelo1(1,1)
modelocorriente1 = Modelo1(2,1)

Modelo2 = zpk(M2);
modelovelocidad2 = Modelo2(1,1)
modelocorriente2 = Modelo2(2,1)

var_estado1 = ss(M1);
var_estado2 = ss(M2);

%% Gráficas para comprobar los modelos
% y = lsim(modelocorriente1,ENTRADA,Tiempo);
% plot(Tiempo, ENTRADA, Tiempo, CORRIENTE, Tiempo, y)
% grid
% title('Verificación de la respuesta del modelo de corriente')
% xlabel('Tiempo [s]')
% ylabel('Corriente')
% legend('Entrada','Corriente','Modelo')

y = lsim(modelovelocidad2,ENTRADA,Tiempo);
plot(Tiempo, ENTRADA, Tiempo, VELOCIDAD, Tiempo, y)
grid
title('Verificación de la respuesta del modelo de velocidad')
xlabel('Tiempo [s]')
ylabel('Velocidad')
legend('Entrada','Velocidad','Modelo')
