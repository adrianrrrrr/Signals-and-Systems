%   File name: rg_dft_properties.m
%   
%   Author: Adrián Ramos González. Professor. 
%   Email: adrian.ramos.gonzalez@upc.edu
%
%   Description: 
%   Lab 4 part of Signal and Systems subject from The School of Industrial,
%   Aerospace and Audiovisual Engineering of Terrassa (ESEIAAT). 
%
%   Discrete Fourier Transform (DFT) is performed in a set of basic
%   signals. Some experiments are run to check basic properties, artifacts
%   and phenomenon happening due mathematical properties of the Fourier
%   Transform applied to discrete systems as in Matlab.
%   
%   Variables: 
%
%%
clear all; close all; clc;

%   Ex. 1: Signal generation
A = 4; % Signal (Cosinus) amplitude 
f = 2000; % Frequency in Hertz
fs = 8e3; % Sampling frequency (8000Hz)
fn = f/fs; % Normalised frequency in range (0,1)
L = 30; % Samples taken from the time series signal
n = 0:30-1; % Vector of discrete samples from time
x = A*cos(2*pi*fn*n); % Temporal signal
figure(1) % Representation of the signal
stem(n,x), xlabel("n"), ylabel("x") 
%! Use stem for discrete signals, it is
% more obvious for their discrete nature. plot is better for continuous
% analysis.
title("x = 4cos(2πfn)")
grid on;

%   Ex. 2: DFT
N=30; % Samples taken from the Fourier Transform
k=0:N-1; % Vector of discrete samples from frequency
tic % Start time counter to measure execution time
X_Matlab = fft(x,N); % Built-in Matlab fft function
MatlabExec = toc; % Stop time counter
% Our custom function get normalized frequencies, we should get them as:
tic
step = 1/N;
k_f = 0:step:(1-step);
X_custom = rg_trf(x,k_f); % Our custom fourier transform function
CustomFunction = toc;
figure(2)
subplot(211)
stem(k,abs(X_Matlab)), xlabel('k'), ylabel('|X[k]| built-in')
grid on;
subplot(212)
stem(k_f,abs(X_Matlab)), xlabel('normalized k'), ylabel('|X[k]| custom')
grid on;
fprintf("Built-in execution time = %.2f ms\n",MatlabExec*1000);
fprintf("Custom execution time = %.2f ms\n",CustomFunction*1000);
performance = (CustomFunction / MatlabExec)*100;
fprintf("Built-in shows = %.2f%% performance increase\n",performance);

%   Ex. 3,4: Measurements
figure(3)
subplot(211)
stem(k,abs(X_Matlab)), xlabel('k'), ylabel('|X[k]|')
grid on; 
% Let's get the frequencies
freqs = (fs*k)/N; % k over N is equal to f over fs. 
subplot(212)
stem(freqs,abs(X_Matlab)), xlabel('f'), ylabel('|X[k]|')
grid on; 
[maxValue,maxIndex] = max(abs(X_Matlab));
maxfreq = maxIndex * fs / N;
ferror = abs(f-maxfreq);
ferror_perc = ferror / f * 100;
fprintf("Absolute frequency error = %.2f\n",ferror);
fprintf("Frequency error = %.2f%%\n",ferror_perc);
% A = max(abs(X(f)))*2/L for pure sinusoid, remember. Then:
aerror = abs(A-maxValue*2/L);
aerror_perc = aerror/A*100;
fprintf("Absolute amplitude error = %.2f\n",aerror);
fprintf("Amplitude error = %.2f%%\n",aerror_perc);

%   Ex.5: Increasing FFT resolution to N2 = 4096 points
%   DFT
N=4096; % Samples taken from the Fourier Transform
k=0:N-1; % Vector of discrete samples from frequency
tic % Start time counter to measure execution time
X_Matlab = fft(x,N); % Built-in Matlab fft function
MatlabExec = toc; % Stop time counter
% Our custom function get normalized frequencies, we should get them as:
tic
step = 1/N;
k_f = 0:step:(1-step);
X_custom = rg_trf(x,k_f); % Our custom fourier transform function
CustomFunction = toc;
figure(4)
subplot(211)
stem(k,abs(X_Matlab)), xlabel('k'), ylabel('|X[k]| built-in')
grid on;
subplot(212)
stem(k_f,abs(X_Matlab)), xlabel('normalized k'), ylabel('|X[k]| custom')
grid on;
fprintf("Built-in execution time = %.2f ms\n",MatlabExec*1000);
fprintf("Custom execution time = %.2f ms\n",CustomFunction*1000);
performance = (CustomFunction / MatlabExec)*100;
fprintf("Built-in shows = %.2f%% performance increase\n",performance);

%   Ex. 3,4: Measurements
figure(5)
subplot(211)
stem(k,abs(X_Matlab)), xlabel('k'), ylabel('|X[k]|')
grid on; 
% Let's get the frequencies
freqs = (fs*k)/N; % k over N is equal to f over fs. 
subplot(212)
stem(freqs,abs(X_Matlab)), xlabel('f'), ylabel('|X[k]|')
grid on; 
[maxValue,maxIndex] = max(abs(X_Matlab));
maxfreq = maxIndex * fs / N;
ferror = abs(f-maxfreq);
ferror_perc = ferror / f * 100;
fprintf("Absolute frequency error = %.2f\n",ferror);
fprintf("Frequency error = %.2f%%\n",ferror_perc);
% A = max(abs(X(f)))*2/L for pure sinusoid, remember. Then:
aerror = abs(A-maxValue*2/L);
aerror_perc = aerror/A*100;
fprintf("Absolute amplitude error = %.2f\n",aerror);
fprintf("Amplitude error = %.2f%%\n",aerror_perc);