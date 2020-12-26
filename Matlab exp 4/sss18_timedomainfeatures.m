clc; %clears screen
clear all; %clears all variables
close all; %closes all windows

%----------------------------------------

%Reading audio data
[data, fs] = audioread('audio.wav');
[~,n] = size(data);
    if n == 2
        data(:,2) = [];
    end
    
%Time domain features for 1sample block shift
mag_1s = zeros(1,31521);
ener_1s = zeros(1,31521);
zcr_1s = zeros(1,31521);
ent_1s = zeros(1,31521);

for i = 1:31521
    mag_temp = 0;
    ener_temp = 0;
    zcr_temp = 0;
    
    for j = i:479+i
        mag_temp = mag_temp + data(j);
        ener_temp = ener_temp + data(j) .^ 2;
        if(j ~= 1)
           if((data(j) * data(j-1) < 0) || data(j) == 0)
              zcr_temp = zcr_temp + 1;
           end
        end
    end
    
    mag_1s(:,i) = mag_temp;
    ener_1s(:,i) = ener_temp;
    zcr_1s(:,i) = zcr_temp;
    ent_1s(:,i) = entropy(data(i:479+i));
end

%Time domain features for 1sample block shift
mag_10msec = zeros(1,198);
ener_10msec = zeros(1,198);
zcr_10msec = zeros(1,198);
ent_10msec = zeros(1,198);

a = 1;
for i = 1:198
    mag_temp = 0;
    ener_temp = 0;
    zcr_temp = 0;
    
    for j = a:479+a
        mag_temp = mag_temp+data(j);
        ener_temp = ener_temp+(data(j).^2);
        if(j ~= 1)
            if( ( data(j) * data(j-1) < 0 ) || data(j) == 0 )
                  zcr_temp = zcr_temp + 1;
            end  
        end
    end
    
    zcr_10msec(:,i) = zcr_temp;
    mag_10msec(:,i) = mag_temp;
    ener_10msec(:,i) = ener_temp;
    ent_10msec(:,i) = entropy(data(a:479+a));
    a = a+160; 
end

%Plot for time domain features for 1sample block shift
figure('NumberTitle', 'off', 'Name', 'Time domain features for 1sample block shift');
subplot(5,1,1);
plot(data);
title('Audio plot');
grid on;

subplot(5,1,2);
plot(mag_1s);
title('Short term magnitude');
grid on;

subplot(5,1,3);
plot(ener_1s);
title('Short term energy');
grid on;

subplot(5,1,4);
plot(zcr_1s);
title('Zerocrossings');
grid on;

subplot(5,1,5);
plot(ent_1s);
title('Entropy');
grid on;

%Plot for time domain features for 10msec block shift
figure('NumberTitle', 'off', 'Name', 'Time domain features for 10msec block shift');
subplot(5,1,1);
plot(data);
title('Audio plot');
grid on;

subplot(5,1,2);
plot(mag_10msec);
title('Short time magnitude');
grid on;

subplot(5,1,3);
plot(ener_10msec);
title('Short time energy');
grid on;

subplot(5,1,4);
plot(zcr_10msec);
title('Zero crossings');
grid on;

subplot(5,1,5);
plot(ent_10msec);
title('Entropy');
grid on;

