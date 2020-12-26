%Create and save two variables, A and B, to a file called AB1file.txt.
clc;
clear all;
close all;

%-------------------------------------

A=7;
B='Hi';
filename='ABfile1.txt';
save(filename,'A','B');