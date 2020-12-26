clc; %clears screen
clear all; %clears all variables
close all; %closes all windows

%-------------------------------------------

w = -2 * pi : 0.01 : 2 * pi;
load cleanppg_Fs_100_10seconds.mat
x = zeros(1, 500);
for i = 1 : 500
   x(1, i) = X2(i);
end

n = 1:length(x);
y = DTFT(x,w,n); %DTFT function

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