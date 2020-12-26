clc; %clears screen
clear all; %clears all variables in workspace
close all; %closes all external Matlab windows

%-------------------------------------------

%input signals
load("baselineppg_Fs_100_16seconds.mat");
load("cleanppg_Fs_100_10seconds.mat");
load("ppg_awgn_20db_Fs_100_10seconds.mat");
load("ppg_awgn_25db_Fs_100_10seconds.mat");
a = [1/3,1/3,1/3]; b = X2; c = X3; d = X4;

%condition
while 1
    in = input("Input signal (1/2/3/4):");
    switch in
        case 1
            inputSignal = a;
            break;
        case 2
            inputSignal = b;
            break;
        case 3
            inputSignal = c;
            break;
        case 4
            inputSignal = d;
            break;
        otherwise
            disp("Enter valid number");
            continue;
    end
end



%frequency response of given systems
h1 = [1];
m = 25;
h2 = zeros(1, m);
for i = 1:m
    h2(i) = 1/m;
end
h3 = [1, -1];
h4 = [1/2, 0, -1/2];

while 1
    h = input("Select system (1/2/3/4):");
    switch h
        case 1
            fRes = h1;
            break;
        case 2
            fRes = h2;
            break;
        case 3
            fRes = h3;
            break;
        case 4
            fRes = h4;
            break;
        otherwise
            disp("Enter valid number");
            continue;
    end
end


out = sss18_convolute(inputSignal, fRes);
% save("inAndOut.mat", "inputSignal", "out", "h2");


