clc;
clear;
close all;

% Read audio file
[x, Fs] = audioread('audio.wav.m4a');

% Time axis
t = (0:length(x)-1)/Fs;

% Apply stronger noise filtering
y = movmean(x,100);

% Plot Original and Filtered Signals
figure;

subplot(2,1,1);
plot(t,x);
title('Original Audio Signal');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

subplot(2,1,2);
plot(t,y);
title('Filtered Audio Signal');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

% Save filtered audio
audiowrite('filtered_audio.wav', y, Fs);

% Play original audio
disp('Playing Original Audio...');
soundsc(x,Fs);
pause(length(x)/Fs + 2);

% Play filtered audio
disp('Playing Filtered Audio...');
soundsc(y,Fs);
