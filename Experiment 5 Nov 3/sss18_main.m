clc; %clears screen
clear all; %clears all variables
close all; %closes all windows

%-------------------------------------------

w = -2 * pi : 0.01 : 2 * pi;
N = input('Enter N value: ');

x = zeros(1, 4 * N);
for i = 3 * N / 2 - 1 : 5 * N / 2 + 1
    x(1,i) = 1;
end

n = -2 * N : 2 * N - 1;
y = DTFT(x, w, n);

%--------------------------------------

diff = y - x;

figure;
subplot(3, 1, 1);plot(iir_output);axis tight;grid on;
subplot(3, 1, 2);plot(fir_output);axis tight;grid on;
subplot(3, 1, 3);plot(diff);axis tight;grid on;

diff = diff .^ 2;
mean_sq_error = mean(diff);
root_mean_sq_error = sqrt(mean(diff));
if root_mean_sq_error < 10 ^ -3
    disp("Outputs are similar");
else
    disp("Outputs are not similar");
end

