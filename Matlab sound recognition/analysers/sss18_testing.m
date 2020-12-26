clc; %clears screen
clear all; %clears all variables
close all; %closes all windows

%-------------------------------------

%taking input audio and normalising it
blocks = 1800;
time = blocks;
Fs = 16000;

%analysing train sound
train = zeros(Fs,blocks);

varOfTrain1 = zeros(blocks,1);
meanOfTrain1 = zeros(blocks,1);
skewOfTrain1 = zeros(blocks,1);
kurOfTrain1 = zeros(blocks,1);

for i = 1:blocks
    train_temp = audioread("train.wav", [1 + (blocks + i - 1) * Fs, (blocks + i) * Fs]);
    [~,n] = size(train_temp);
    if n == 2
        train_temp(:,1) = (train_temp(:,1) + train_temp(:,2)) / 2;
        train_temp(:,2) = [];
    end
    train(:,i) = audioNormalize(train_temp , 1);
    
    meanOfTrain1(i) = mean(train(:,i));
    varOfTrain1(i) = var(train(:,i));
    skewOfTrain1(i) = skewness(train(:,i));
    kurOfTrain1(i) = kurtosis(train(:,i));
end

meanOfTrain1 = sort(meanOfTrain1);
varOfTrain1 = sort(varOfTrain1);
skewOfTrain1 = sort(skewOfTrain1);
kurOfTrain1 = sort(kurOfTrain1);

%----------------------------

fan = zeros(Fs,blocks);

varOfFan1 = zeros(blocks,1);
meanOfFan1 = zeros(blocks,1);
skewOfFan1 = zeros(blocks,1);
kurOfFan1 = zeros(blocks,1);

for i = 1:blocks
    fan_temp = audioread("fan.wav", [1 + (blocks + i - 1) * Fs, (blocks + i) * Fs]);
    [~,n] = size(fan_temp);
    if n == 2
        fan_temp(:,1) = (fan_temp(:,1) + fan_temp(:,2)) / 2;
        fan_temp(:,2) = [];
    end
    fan(:,i) = audioNormalize(fan_temp , 1);
    
    meanOfFan1(i) = mean(fan(:,i));
    varOfFan1(i) = var(fan(:,i));
    skewOfFan1(i) = skewness(fan(:,i));
    kurOfFan1(i) = kurtosis(fan(:,i));
end

meanOfFan1 = sort(meanOfFan1);
varOfFan1 = sort(varOfFan1);
skewOfFan1 = sort(skewOfFan1);
kurOfFan1 = sort(kurOfFan1);

%-------------------------------------

human = zeros(Fs,blocks);

varOfHuman1 = zeros(blocks,1);
meanOfHuman1 = zeros(blocks,1);
skewOfHuman1 = zeros(blocks,1);
kurOfHuman1 = zeros(blocks,1);

for i = 1:blocks
    human_temp = audioread("human.wav", [1 + (blocks + i - 1) * Fs, (blocks + i) * Fs]);
    [~,n] = size(human_temp);
    if n == 2
        human_temp(:,1) = (human_temp(:,1) + human_temp(:,2)) / 2;
        human_temp(:,2) = [];
    end
    human(:,i) = audioNormalize(human_temp , 1);
    
    meanOfHuman1(i) = mean(human(:,i));
    varOfHuman1(i) = var(human(:,i));
    skewOfHuman1(i) = skewness(human(:,i));
    kurOfHuman1(i) = kurtosis(human(:,i));
end

meanOfHuman1 = sort(meanOfHuman1);
varOfHuman1 = sort(varOfHuman1);
skewOfHuman1 = sort(skewOfHuman1);
kurOfHuman1 = sort(kurOfHuman1);

%-------------------------------------------------------

save("testing_values.mat","meanOfTrain1","meanOfFan1","meanOfHuman1","varOfTrain1","varOfFan1","varOfHuman1","skewOfTrain1","skewOfFan1","skewOfHuman1","kurOfTrain1","kurOfFan1","kurOfHuman1");













