clc;
clear all;
close all;
%-----------------------------

%Nested if statement
a=16;
if mod(a,2)==0
    if a<10
        disp('a is an even integer less than 10');
    else
        disp('a is an even integer greater than or equal to 10');
    end
else
    if a<10
        disp('a is an odd integer less than 10');
    else
        disp('a is an odd integer greater than or equal to 10');
    end
end
    
    