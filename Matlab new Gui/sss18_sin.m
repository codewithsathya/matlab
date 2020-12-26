clear all;
close all;
clc;
%-----------------------------------------

w=0:0.1:15000;
logw=log(w);
r=10000;
c=5.3*10^(-6);
h=1./((1+(r*c*w).^2).^(0.5));
logh=log(h);
figure;
subplot(2,2,1);
plot(w,h);grid on;
title('|H(jw)| v/s w');

subplot(2,2,2);
plot(logw,h);grid on;
title('|H(jw)| v/s log(w)');

subplot(2,2,3);
plot(logw,logh);grid on;
title('log(|H(jw)|) v/s log(w)');

subplot(2,2,4);
plot(logw,20*logh);grid on;
title('20log(|H(jw)|) v/s log(w)');
