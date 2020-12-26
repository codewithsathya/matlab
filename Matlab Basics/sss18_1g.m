%{
Create a column vector X1, from the elements of the 4th row of the matrix
’X’.
%}
clc;
clear all;
close all;

%-------------------------------------

X=[5 7 2 -6 1; 4 -9 -3 2 5; 3 1 7 4 -6; 2 -6 1 8 -3; -7 3 -4 -2 6];
X1=transpose(X(4,:));
