clc;
clear all;
close all;
%----------------------------------

%permute function
A=[1 2 3 4; 5 6 7 8; 9 10 11 12]
B=permute(A,[2 1])

%circshift function
C=circshift(A,[2 1])

%length function
x=length(A)

%size function
y=size(A)

%ndims function
z=ndims(A)

%numel function
m=numel(A)

%isempty function
n=isempty(A)
