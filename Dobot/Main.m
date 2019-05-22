%% Main
 
close all;
clear;
clc;

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

