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

figure;
subplot(3, 1, 1);
stem(n, x);xlabel('n'); ylabel('magnitude'); 
title('input'); grid on;

subplot(3, 1, 2);
plot(w, abs(y)); 
xlabel('w(omega)'); ylabel('magnitude'); 
title('magnitude'); grid on;

subplot(3, 1, 3);
plot(w, angle(y)); 
xlabel('w(omega)'); ylabel('phase(radians)'); 
title('phase spectra'); grid on;
        