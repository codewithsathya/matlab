clc;
clear all;
close all;

%-------------------------------------
%Create a simple vector with 10 elements called A
A=[5 3 7 -2 6 -9 1 8 -5 4]

%Add 3 to each element of vector A and store the result in a new vector ’B’
B=A+3

%{
Creating a 5 x 5 matrix ’X’ using semicolons (;) to separate the rows of a
matrix.
%}
X=[5 7 2 6 1; 4 -9 -3 2 5; 3 1 7 4 -6; 2 -6 1 8 -3; -7 3 -4 -2 6]

%Find the transpose of the matrix X and store the result in a new matrix ’Y’
Y=transpose(X)  %Y=X.';

%Multiply these two matrices, ’X’ and ’Y’
Z=X*Y

%Multiply the corresponding elements of two matrices
Z1=X.*Y

%{
Create a column vector X1, from the elements of the 4th row of the matrix
’X’
%}
X1=transpose(X(4,:))

%Select the elements in the mth through nth columns of matrix ’X’.
m=2
n=4
Y1=X(:,m:n)

%Create a sub-matrix ’X2’ taking the inner sub-part of matrix ’X’.
X2=X(2:4,1:3)

%Delete a Row or a Column in a Matrix ’X’.
%X(2,:)=[]