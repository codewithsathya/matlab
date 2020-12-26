%{
Save two variables to ’example.mat’. Then, append a third variable to
the same file.
%}
clc;
clear all;
close all;

%-------------------------------------

A=7;
B=8;
filename='example.mat';
save(filename);
C='Hi';
save(filename,'C','-append');