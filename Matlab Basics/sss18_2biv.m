%{ 
Create two variables, save them to an ASCII file, and then view the contents of the file.
%}
clc;
clear all;
close all;

%-------------------------------------

A=7;
B='Hi';
filename='ascii.txt';
save(filename,'A','B','-ascii');