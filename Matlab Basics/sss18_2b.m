clc;
clear all;
close all;

%-------------------------------------

A=7;
B='Hi';
%Create and save two variables, A and B, to a file called ABfile.mat
filename='ABfile.mat';
save(filename,'A','B')

%Create and save two variables, A and B, to a file called ABfile.txt
filename='ABfile1.txt';
save(filename,'A','B');

%Create and save two variables, A and B, to a file called AB1file.xls
filename='ABfile1.xls';
save(filename,'A','B');

%Create two variables, save them to an ASCII file, and then view the
%contents of the file.
filename='ascii.txt';
save(filename,'A','B','-ascii');

%Create a structure, s1, that contains three fields, a, b, and c. Save the
%fields of structure s1 as individual variables in a file called newstruct.mat
s1.a = 7;
s1.b = 9;
s1.c = 'Hi';
save('newstruct.mat','-struct','s1');

%Save two variables to ’example.mat’. Then, append a third variable to
%the same file.
filename='example.mat';
save(filename,'A','B');
C='Hello';
save(filename,'C','-append');