clc; %clears screen
clear all; %clears all variables
close all; %closes all windows

%-------------------------------------------


w = -2 * pi : 0.01 : 2 * pi;
N = 20;

x = zeros(1, 4 * N);
for i = 3 * N / 2 - 1 : 5 * N / 2 + 1
    x(1,i) = 1;
end

n1 = -2 * N + 1 : 2 * N;
n2 = -2 * N + 10 : 2 * N + 9;
y1 = DTFT(x, w, n1);

y2 = DTFT(x, w, n2);

y3 = y2 ./ y1;

p = angle(y3)./w;
m = -p(round(length(p)/2));

figure;
subplot(2, 1, 1);
stem(n1, x);xlabel('n'); ylabel('magnitude'); 
title('input'); grid on;

subplot(2, 1, 2);
plot(w, abs(y1)); 
xlabel('w(omega)'); ylabel('magnitude'); 
title('magnitude'); grid on;


figure;
subplot(2, 1, 1);
stem(n2, x);xlabel('n'); ylabel('magnitude'); 
title('input'); grid on;

subplot(2, 1, 2);
plot(w, abs(y2)); 
xlabel('w(omega)'); ylabel('magnitude'); 
title('magnitude'); grid on;
