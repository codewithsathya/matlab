%{
readcell and writecell commands: (writes to a file with the name and
extension specified as .txt, .dat, .xls or .csv for delimited text files)
%}
clc;
clear all;
close all;

%-------------------------------------

A={7,8,'hi';'hello',-4,0};
writecell(A,"A.dat"); %creates A.txt file
B=readcell('A.txt')
