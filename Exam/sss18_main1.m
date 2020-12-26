clc; %clears screen
clear all; %clears variables in workspace
close all; %closes all other Matlab figures

%------------------------------------

load baselineppg_Fs_100_16seconds.mat;
m = input('Value of m: ');

x = Xb2;
y = zeros(1,length(x));

%For IIR system
disp("For IIR system");

tic
for n = 1:length(x)
    if n - m < 1
        if n > 1
            y(n) = y(n - 1) + (1 / m) * x(n);
        else
            y(n) = (1 / m) * x(n);
        end
    else
        y(n) = y(n - 1) + (1 / m) * (x(n) - x(n - m));
    end
end
for n = 1001 : (1000 + m - 1)
    y(n) = y(n - 1) + (1 / m) * x(n - m);
end
toc

y = y(1, 1: length(x));
y2 =zeros(1,length(x));

for i = 1601: length(x)
    x(i) = 0;
end
for i = 1: length(x)
    y2(i) = x(i) - y(i);
end
figure;
subplot(2,1,1);
plot(x);grid on;
title("Input signal which has trend");

subplot(2,1,2);
plot(y2);grid on;
title("Output signal with trend removed");