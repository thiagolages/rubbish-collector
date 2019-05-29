%% Main
 
close all;
clear;
clc;
set(0,'DefaultFigureWindowStyle','docked')

%% Create Dobot

% Sets the base location of the Dobot
dobotBase = [0, 0, pi/2];

% Displays the status
disp('Creating Dobot...');

% Creates the dobot
createDobot = Dobot('Dobot',dobotBase);
hold on;
camlight;

% Displays the status
disp('Dobot Created...');
disp('Press Enter to Commence Dobot Movement...');
pause

%% Dobot Simulation

% Displays the status
disp('Moving Dobot to [0, 0.2, 0.1]');

[q] = MoveDobot.ikcon(createDobot, 0, 0.2, 0.1);
MoveDobot.MoveRobot(createDobot, q);

disp('Moving Dobot to [0.2, 0, 0.1]');

[q] = MoveDobot.ikcon(createDobot, 0.2, 0, 0.1);
MoveDobot.MoveRobot(createDobot, q);

disp('Moving Dobot to [-0.2, 0, 0.2]');

[q] = MoveDobot.ikcon(createDobot, -0.2, 0, 0.2);
MoveDobot.MoveRobot(createDobot, q);

% Displays the transforms
disp('Movement Completed...');
