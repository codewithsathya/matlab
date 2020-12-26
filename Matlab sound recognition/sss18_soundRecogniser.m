clc; %clears screen
clear all; %clears all variables
close all; %closes all windows

%-------------------------------------

%taking input audio and normalising it
samples = input("Enter duration of input audio file in sec: ");
samples = 16000 * samples;
audio_in = input("Enter the name of the audio file: ","s");
audio_in_data = audioread(audio_in);
[~,n] = size(audio_in_data);
if n == 2
    audio_in_data(:,1) = (audio_in_data(:,1) + audio_in_data(:,2)) / 2;
    audio_in_data(:,2) = [];
end
audio_in_data = audioNormalize(audio_in_data , 1);

%analysing train sound
x = audioread("train.wav");
[~,n] = size(x);
if n == 2
    x(:,1) = (x(:,1) + x(:,2)) / 2;
    x(:,2) = [];
end
train = zeros(samples,20);
varOfTrain = zeros(20,1);
kurOfTrain = zeros(20,1);
for i = 1:20
    train(: , i) =  x(1 + (i - 1) * samples: i * samples, 1); 
end
for i = 1:20
    train(:,i) = audioNormalize(train(:,i) , 1);
    varOfTrain(i) = var(train(:,i));
    kurOfTrain(i) = kurtosis(train(:,i));
end

%analysing fan sound
y = audioread("fan.wav");
[~,n] = size(y);
if n == 2
    y(:,1) = (y(:,1) + y(:,2)) / 2;
    y(:,2) = [];
end
fan = zeros(samples,20);
varOfFan = zeros(20,1);
kurOfFan = zeros(20,1);
for i = 1:20
    fan(: , i) =  y(1 + (i - 1) * samples: i * samples, 1); 
end
for i = 1:20
    fan(:,i) = audioNormalize(fan(:,i) , 1);
    varOfFan(i) = var(fan(:,i));
    kurOfFan(i) = kurtosis(fan(:,i));
end

%analysing human sound
z = audioread("human.wav");
[~,n] = size(z);
if n == 2
    z(:,1) = (z(:,1) + z(:,2)) / 2;
    z(:,2) = [];
end
human = zeros(samples,20);
varOfHuman= zeros(20,1);
kurOfHuman= zeros(20,1);
for i = 1:20
    human(: , i) =  z(1 + (i - 1) * samples: i * samples, 1); 
end
for i = 1:20
    human(:,i) = audioNormalize(human(:,i) , 1);
    varOfHuman(i) = var(human(:,i));
    kurOfHuman(i) = kurtosis(human(:,i));
end

%variance and kurtosis of input audio
varOfInput = var(audio_in_data);
kurOfInput = kurtosis(audio_in_data);

%difference between variance of input and fan, train and human
diffVarFan = abs(varOfInput - sort(varOfFan));
diffVarTrain = abs(varOfInput - sort(varOfTrain));
diffVarHuman = abs(varOfInput - sort(varOfHuman));

scoreFan = 0;
scoreTrain = 0;
scoreHuman = 0;

for i = 1:20
    if diffVarFan(i) < diffVarTrain(i) && diffVarFan(i) < diffVarHuman(i)
        scoreFan = scoreFan + 1;
    elseif diffVarTrain(i) < diffVarFan(i) && diffVarTrain(i) < diffVarHuman(i)
        scoreTrain = scoreTrain + 1;
    elseif diffVarHuman(i) < diffVarFan(i) && diffVarHuman(i) < diffVarTrain(i)
        scoreHuman = scoreHuman + 1;
    end
end

%difference between variance of input and fan, train and human
diffKurFan = abs(kurOfInput - sort(kurOfFan));
diffKurTrain = abs(kurOfInput - sort(kurOfTrain));
diffKurHuman = abs(kurOfInput - sort(kurOfHuman));

for i = 1:20
    if diffKurFan(i) < diffKurTrain(i) && diffKurFan(i) < diffKurHuman(i)
        scoreFan = scoreFan + 1;
    elseif diffKurTrain(i) < diffKurFan(i) && diffKurTrain(i) < diffKurHuman(i)
        scoreTrain = scoreTrain + 1;
    elseif diffKurHuman(i) < diffKurFan(i) && diffKurHuman(i) < diffKurTrain(i)
        scoreHuman = scoreHuman + 1;
    end
end

if scoreFan > scoreHuman && scoreTrain > scoreHuman && scoreFan == scoreTrain
    if (kurOfInput - mean(kurOfFan)) < (kurOfInput - mean(kurOfTrain))
        scoreFan = scoreFan + 1;
    elseif (kurOfInput - mean(kurOfFan)) > (kurOfInput - mean(kurOfTrain))
        scoreTrain = scoreTrain + 1;
    end
elseif scoreFan > scoreTrain && scoreHuman > scoreTrain && scoreFan == scoreHuman
    if (kurOfInput - mean(kurOfFan)) < (kurOfInput - mean(kurOfHuman))
        scoreFan = scoreFan + 1;
    elseif (kurOfInput - mean(kurOfFan)) > (kurOfInput - mean(kurOfHuman))
        scoreHuman = scoreHuman + 1;
    end
elseif scoreHuman > scoreFan && scoreTrain > scoreFan && scoreTrain == scoreHuman
    if (kurOfInput - mean(kurOfTrain)) < (kurOfInput - mean(kurOfHuman))
        scoreTrain = scoreTrain + 1;
    elseif (kurOfInput - mean(kurOfFan)) > (kurOfInput - mean(kurOfHuman))
        scoreHuman = scoreHuman + 1;
    end
end

if scoreFan > scoreTrain && scoreFan > scoreHuman
    fprintf("The input audio may be sound of Fan");
elseif scoreTrain > scoreFan && scoreTrain > scoreHuman
    fprintf("The input audio may be sound of Train");
elseif scoreHuman > scoreFan && scoreHuman > scoreTrain
    fprintf("The input audio may be sound of Human speech");
end

%histogram(audio_in_data,100);
% histogram(human,100);
% 
% histogram(fan,100);
% histogram(train,100);




