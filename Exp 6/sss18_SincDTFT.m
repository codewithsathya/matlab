clc; %clears screen
clear all; %clears all variables
close all; %closes all windows

%-------------------------------------------

w = -2 * pi : 0.01 : 2 * pi;
N = input('Enter n value: ');
x = zeros(1, N);
n = -length(x)/2 : length(x)/2 - 1;
for i = 1 : N
    if n(i) == 0
        x(i) = 1;
    else
        x(i) = sin(n(i)) / n(i);
    end
end

y = DTFT(x, w, n); %DTFT function

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