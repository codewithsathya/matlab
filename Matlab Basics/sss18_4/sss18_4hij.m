clc;
clear all;
close all;
%----------------------------------

%cat command usage
A=[1 2 3; 4 5 6; 7 8 9]
B=[8 7 5; 1 2 7; 5 8 3]
C=cat(2,A,B)
D=cat(1,A,B)

%horzcat command
C1=horzcat(A,B)

%vertcat command
D1=vertcat(A,B)