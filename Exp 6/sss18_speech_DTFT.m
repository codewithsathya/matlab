clc; %clears screen
clear all; %clears all variables
close all; %closes all windows

%-------------------------------------------

w = -2 * pi : 0.01 : 2 * pi;

% [x,fs] = audioread('speech.wav');

[x1,fs1] = audioread('speech.wav',[1,480]);
[x2,fs2] = audioread('speech.wav',[1,8000]);

n = 1 : length(x1);
y = DTFT(x1, w, n); %DTFT function

figure;
subplot(3, 1, 1);
plot(n, x1);
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

n=1:length(x2);
y = DTFT(x2,w,n); %DTFT function

figure;
subplot(3, 1, 1);
plot(n, x2);xlabel('n'); ylabel('magnitude'); 
title('input'); grid on;

subplot(3, 1, 2);
plot(w, abs(y)); 
xlabel('w(omega)'); ylabel('magnitude'); 
title('magnitude'); grid on;

subplot(3, 1, 3);
plot(w, angle(y)); 
xlabel('w(omega)'); ylabel('phase(radians)'); 
title('phase spectra'); grid on;

