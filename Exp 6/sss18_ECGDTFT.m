clc; %clears screen
clear all; %clears all variables
close all; %closes all windows

%-------------------------------------------

w = -pi : 0.01 : pi;
load ECG.mat;

for i = 1 : 1800
   x(i) = val(i);
end

n = 1 : length(x);
y = DTFT(x, w, n); %calling DTFT function block

figure;
subplot(3, 1, 1);
plot(n, x);
xlabel('n'); ylabel('magnitude'); 
title('input'); grid on;

subplot(3, 1, 2);
plot(w, abs(y)); 
xlabel('w(omega)'); ylabel('magnitude'); 
title('magnitude'); grid on;

subplot(3, 1, 3);
plot(w, angle(y)); 
xlabel('w(omega)'); ylabel('phase(radians)'); 
title('phase spectra'); grid on;
