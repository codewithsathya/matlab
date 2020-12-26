%{
Read audio files in a range of different file formats, including .wav, .mp4,
.au, .ogg, etc. and also write sound files in different formats, including .wav,
.mp4, .au, .ogg, etc.
%}
clc;
clear all;
close all;

%-------------------------------------

load 'handel.mat';  %inbuilt audio data
file1='audio.wav';

audiowrite(file1,y,Fs);
[a,b]=audioread('audio.wav');
[c,d]=audioread('hello.mp3');
z=histogram(y,10);
grid on;
