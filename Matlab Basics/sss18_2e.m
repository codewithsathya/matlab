%{
writematrix, write a matrix to a file and readmatrix, read matrix from
file: (writes to a file with the name and extension specified as .txt, .dat, .xls
or .csv for delimited text files)
%}
clc;
clear all;
close all;

%-------------------------------------

A=[5 7 2 -6 1; 4 -9 -3 2 5; 3 1 7 4 -6; 2 -6 1 8 -3; -7 3 -4 -2 6];
writematrix(A); %creates A.txt file
B=readmatrix('A.txt');
