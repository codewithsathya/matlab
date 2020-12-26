clc; %clears screen
clear all; %clears all variables
close all; %closes all windows

%-------------------------------------

%taking input audio and normalising it
blocks = 1800;
Fs = 16000;

%analysing train sound
train = zeros(Fs,blocks);

%initialising features
varOfTrain = zeros(blocks,1);
meanOfTrain = zeros(blocks,1);
skewOfTrain = zeros(blocks,1);
kurOfTrain = zeros(blocks,1);

for i = 1:blocks
    train_temp = audioread("train.wav", [1 + (i - 1) * Fs, i * Fs]);
    [~,n] = size(train_temp);
    %checks whether audio is stereo or mono
    if n == 2
        train_temp(:,1) = (train_temp(:,1) + train_temp(:,2)) / 2;
        train_temp(:,2) = [];
    end
    
    train(:,i) = audioNormalize(train_temp , 1);
    
    %calculating statistics
    meanOfTrain(i) = mean(train(:,i));
    varOfTrain(i) = var(train(:,i));
    skewOfTrain(i) = skewness(train(:,i));
    kurOfTrain(i) = kurtosis(train(:,i));
end

%sorting to plot the values
meanOfTrain = sort(meanOfTrain);
varOfTrain = sort(varOfTrain);
skewOfTrain = sort(skewOfTrain);
kurOfTrain = sort(kurOfTrain);

%----------------------------


%analysing fan sound
fan = zeros(Fs,blocks);

varOfFan = zeros(blocks,1);
meanOfFan = zeros(blocks,1);
skewOfFan = zeros(blocks,1);
kurOfFan = zeros(blocks,1);

for i = 1:blocks
    fan_temp = audioread("fan.wav", [1 + (i - 1) * Fs, i * Fs]);
    [~,n] = size(fan_temp);
    if n == 2
        fan_temp(:,1) = (fan_temp(:,1) + fan_temp(:,2)) / 2;
        fan_temp(:,2) = [];
    end
    fan(:,i) = audioNormalize(fan_temp , 1);
    
    meanOfFan(i) = mean(fan(:,i));
    varOfFan(i) = var(fan(:,i));
    skewOfFan(i) = skewness(fan(:,i));
    kurOfFan(i) = kurtosis(fan(:,i));
end

meanOfFan = sort(meanOfFan);
varOfFan = sort(varOfFan);
skewOfFan = sort(skewOfFan);
kurOfFan = sort(kurOfFan);

%-------------------------------------


%anlalysing human speech
human = zeros(Fs,blocks);

varOfHuman = zeros(blocks,1);
meanOfHuman = zeros(blocks,1);
skewOfHuman = zeros(blocks,1);
kurOfHuman = zeros(blocks,1);

for i = 1:blocks
    human_temp = audioread("human.wav", [1 + (i - 1) * Fs, i * Fs]);
    [~,n] = size(human_temp);
    if n == 2
        human_temp(:,1) = (human_temp(:,1) + human_temp(:,2)) / 2;
        human_temp(:,2) = [];
    end
    human(:,i) = audioNormalize(human_temp , 1);
    
    meanOfHuman(i) = mean(human(:,i));
    varOfHuman(i) = var(human(:,i));
    skewOfHuman(i) = skewness(human(:,i));
    kurOfHuman(i) = kurtosis(human(:,i));
end

meanOfHuman = sort(meanOfHuman);
varOfHuman = sort(varOfHuman);
skewOfHuman = sort(skewOfHuman);
kurOfHuman = sort(kurOfHuman);

x = 1:blocks;

save("values.mat","x","meanOfTrain","meanOfFan","meanOfHuman","varOfTrain","varOfFan","varOfHuman","skewOfTrain","skewOfFan","skewOfHuman","kurOfTrain","kurOfFan","kurOfHuman");


%-------------------------------------------------------















