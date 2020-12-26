clc;
clear all;
close all;
%-----------------------------

%switch statement
n=4;
switch n
    case 1
        disp('Sunday');
    case 2
        disp('Monday');
    case 3
        disp('Tuesday');
    case 4
        disp('Wednesday');
    case 5
        disp('Thursday');
    case 6
        disp('Friday');
    case 7
        disp('Saturday');
    otherwise
        disp('Error');
end
        