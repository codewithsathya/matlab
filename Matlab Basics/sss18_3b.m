clc;
clear all;
close all;

%-------------------------------------

x=-5:0.01:10;
y=x.^2 + 0.5*x + 2;
figure;
plot(x,y);grid on;