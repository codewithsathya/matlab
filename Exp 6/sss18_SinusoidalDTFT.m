clc; %clears screen
clear all; %clears all variables
close all; %closes all windows

%-------------------------------------------

w = -2 * pi : 0.01 : 2 * pi;
f = input('Enter frequency: ');
A = input('Enter Amplitude: ');
fs = input('Enter sampling frequency: ');
N = input('Enter no of cycles: ');
d = input('Enter angle in degrees:');

T = 1 / f;
t = 0 : 1 / fs : T * N; 
x = A * sin((2 * pi * f * t) + (d * 2 * pi / 360));

n = 1:length(t);
y = DTFT(x,w,n); %DTFT function

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