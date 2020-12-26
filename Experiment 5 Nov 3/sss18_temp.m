clc;
close all;
clear all;

load('ppg_awgn_25db_Fs_100_10seconds.mat');
h=[1,-1];

z=sss18_convolute(X3,h);

figure;
subplot(2,1,1);plot(X3);
subplot(2,1,2);plot(z);