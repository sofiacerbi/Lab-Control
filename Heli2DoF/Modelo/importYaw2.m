%% Import data from text file
% Script for importing data from the following text file:
%
%    filename: Y:\S2 2021\Lab Control Automático\Heli2DoF\HELI_Exp_Yaw_28Oct.csv
%
% Auto-generated by MATLAB on 03-Nov-2021 22:23:46

%% Set up the Import Options and import the data
opts = delimitedTextImportOptions("NumVariables", 5);

% Specify range and delimiter
opts.DataLines = [65, Inf];
opts.Delimiter = ";";

% Specify column names and types
opts.VariableNames = ["Tiempo", "PITCH", "YAW", "E_YAW", "E_PITCH"];
opts.VariableTypes = ["double", "double", "double", "double", "double"];

% Specify file level properties
opts.ExtraColumnsRule = "ignore";
opts.EmptyLineRule = "read";

% Import the data
tbl = readtable("Y:\S2 2021\Lab Control Automático\Heli2DoF\HELI_Exp_Yaw_28Oct.csv", opts);

%% Convert to output type
Tiempo = tbl.Tiempo;
PITCH = tbl.PITCH;
YAW = tbl.YAW;
E_YAW = tbl.E_YAW;
E_PITCH = tbl.E_PITCH;

%% Clear temporary variables
clear opts tbl