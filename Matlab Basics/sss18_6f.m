clc;
clear all;
close all;
%-----------------------------

%Nested switch
a=2;
b=1;
switch a
    case 1
        switch b
            case 1
                disp('a=1,b=1');
            case 2
                disp('a=1,b=2');
        end
    case 2
        switch b
            case 1
                disp('a=2,b=1');
            case 2
                disp('a=2,b=2');
        end
end