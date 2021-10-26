%% Initialize:
clear all;
close all;
clc;
warning('off', 'MATLAB:table:ModifiedAndSavedVarnames')

%% Identify all CSV files in the Current folder.
NoOfFiles = 46; %Number of trajectory files in the directory (set manually)
d = (1:NoOfFiles);

%% Generate Space x Time diagram.
%You can use the functions: lab1_vehicle_data, lab1_plot_TS_diag, lab1_format_TS_diag
for i=1:NoOfFiles
    [time, space, speed] = lab1_vehicle_data(i);
    lab1_plot_TS_diag(time,space,speed);
    hold on
end
lab1_format_TS_diag()

%% Spacing and headways of 5 vehicles:
% Parameters:
vehicles=[];  % Sampled vehicles (trajectory IDs).
Ti=616;         % Initial time.
T=60;           % Time length.
dT=1;           % Time interval between measurements.
Li=10;          % Position of the first stationary observer.
dL=25;          % Length between stationary observers.
hT=9;       % Number intervals between stationary observers.
L=Li+hT*dL;     % Position of the last stationary observer.

% Spacings:
% You can use the function: lab1_spacings 
% and the Matlab functions: mean, std 

spacings=zeros(length(Ti:dT:Ti+T),2);

%Develop your code here ---------
k=1;
for t=Ti:dT:Ti+T
    [S, positions] = lab1_spacings([38,39,40,41,42],t);
    spacings(k,1)=mean(S);
    spacings(k,2)=std(S);k=k+1;
end
spacings
figure();
plot(Ti:dT:Ti+T,spacings(:,1));

% Headways:
% You can use the function: lab1_trap  
% and the Matlab functions mean, std 

headways=zeros(length(Li:dL:L),2);

%Develop your code here -----------
j=1;
for X=Li:dL:L
    times = lab1_trap([38,39,40,41,42],X);
    headways(j,1)=mean(times);
    headways(j,2)=std(times);j=j+1;
end
headways
figure();
plot(Li:dL:L,headways(:,1));
