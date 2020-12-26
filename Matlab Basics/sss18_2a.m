%{
Generate elementary signals and display using plot, subplot and stem commands in MATLAB. Also add xlabel, ylabel, axis tight, grid on, legend
to the figure.
%}
clc;
clear all;
close all;

%-------------------------------------
x=-5:0.1:5;
n=-5:5;

y0=sin(0.4*pi*x);   %sin signal
y1=cos(0.4*pi*x);   %cos signal
y2=exp(x);  %exponential signal
y3=(n>=0);  %Unit step signal
y4=(n>=0).*n;   %ramp signal

%sin and cos signal
figure;
subplot(2,2,1);
plot(x,y0);
hold on;
plot(x,y1);
xlabel('x');ylabel('sin x');
grid on;
legend('sinx','cosx');

%exponential signal
subplot(2,2,2);
plot(x,y2);
xlabel('x');ylabel('exp x');
grid on;

%Unit step signal
subplot(2,2,3);
stem(n,y3);
xlabel('n');ylabel('y');
grid on;

%ramp signal
subplot(2,2,4);
stem(n,y4);
xlabel('n');ylabel('y');
grid on;
axis tight;
