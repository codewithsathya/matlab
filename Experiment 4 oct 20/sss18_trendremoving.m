clc;
clear all;
close all;
%-------------------------------------------

%Input signal which has trend
load("baselineppg_Fs_100_16seconds.mat");
input = Xb2;

%frequency response of 2nd system
m = 100;
h = zeros(1, m);
tic
for i = 1:m
    h(i) = 1/m;
end
toc

%output signal
output = sss18_convolute(input, h);

input = [input, zeros(1, length(h) - 1)];
%removing trend
result = input - output;

figure;
subplot(2,1,1);
plot(input);
title("baselineppg Fs 100 16seconds with trend");
grid on;xlabel("n");ylabel("Y[n]");

subplot(2,1,2);
plot(result);
title("baselineppg Fs 100 16seconds after removing trend");
grid on;xlabel("n");ylabel("Y[n]");