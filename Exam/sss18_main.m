clc; %clears screen
clear all; %clears variables in workspace
close all; %closes all other Matlab figures

%------------------------------------

load baselineppg_Fs_100_16seconds.mat;
m = input('Value of m: ');

x = Xb2;
y = zeros(1,length(x));

%For FIR system

h = (1 / m) * (ones(1, m));
disp("For FIR system");
tic
output_signal = sss18_convolute(x, h);
toc