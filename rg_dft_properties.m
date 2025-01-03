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
n = 0:L-1; % Vector of discrete samples from time
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

%   Measurements
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

%% 
%   Ex. 9: Now L = 32. N = 512
clear all; close all; clc;

%   Signal generation
A = 4; % Signal (Cosinus) amplitude 
f = 2000; % Frequency in Hertz
fs = 8e3; % Sampling frequency (8000Hz)
fn = f/fs; % Normalised frequency in range (0,1)
L = 32; % Samples taken from the time series signal
n = 0:L-1; % Vector of discrete samples from time
x = A*cos(2*pi*fn*n); % Temporal signal
figure(1) % Representation of the signal
subplot(311)
stem(n,x), xlabel("n"), ylabel("x") 
%! Use stem for discrete signals, it is
% more obvious for their discrete nature. plot is better for continuous
% analysis.
title("x = 4cos(2πfn)")
grid on;

%   DFT taking ex. 2 parameters
L_old = 30; % Samples taken from the time series signal
n_old = 0:L-1; % Vector of discrete samples from time
x_old = A*cos(2*pi*fn*n_old); % Temporal signal
N_old=30; % Samples taken from the Fourier Transform
k_old=0:N_old-1; % Vector of discrete samples from frequency
X_old = fft(x,N_old); % Built-in Matlab fft function
subplot(312)
stem(k_old,abs(X_old)), xlabel('k'), ylabel('|X[k]| for L=30, N=30')
grid on;

%   DFT for N = 512
N=512; % Samples taken from the Fourier Transform
k=0:N-1; % Vector of discrete samples from frequency
X = fft(x,N); % Built-in Matlab fft function
subplot(313)
stem(k,abs(X)), xlabel('k'), ylabel('|X[k]| for L=32, N=512')
grid on;

%   Ex. 10:
y_old = ifft(X_old,L_old);
y = ifft(X,L);
figure(2)
subplot(311)
stem(n,x), xlabel('n'), ylabel('x original')
grid on;
subplot(312)
n_old = 0:L_old-1
stem(n_old,y_old), xlabel('n'), ylabel('x reconstructed L=N=30')
grid on;
subplot(313)
stem(n,y), xlabel('n'), ylabel('x reconstructed L=32 N=512')
grid on;

%% Ex. 11: Windowing (Triangular window)

%   Ex. 11: Now L = 19. fn = 0.25. n =[-9,9]
clear all; close all; clc;
A = 4;
Fx = 0.25; % Now we got the normalized frequency
n = -9:9; % The signal is non-causal (Negative values)
x = A*cos(2*pi*Fx*n);
w = [1:10,9:-1:1]/10; % Triangular window
y = x.*w; % Windowing the original signal

%   Ex. 12:
figure(1)
subplot(311)
stem(n,x,"filled")
title('x[n],w[n] and y[n]'), ylabel('x[n]'), xlabel('n')
subplot(312)
stem(n,w), ylabel('w[n]'), xlabel('n')
subplot(313)
stem(n,y), ylabel('y[n]'), xlabel('n')

%   Ex. 13: Temporal shift (Delay) of 9 samples 
n1 = 0:18; % Temporal refference 
y1 = y; % It is the same vector, just changes the temporal refference

%   Ex. 14: DFT
N = 19;
Y1 = fft(y1,N);
figure(2)
subplot(311)
stem(n1,y1), ylabel('y1[n1]'), xlabel('n1')
title('y[n],Y[k] and Y[k] phase for N=19'), ylabel('x[n]'), xlabel('n')
subplot(312)
stem(abs(Y1)), ylabel('|X[k]|'), xlabel('k')
subplot(313)
stem(angle(Y1)), ylabel('\Phi_X[k]'), xlabel('k')

%   Ex. 15: DFT N=512 (Window-applied signal)
N = 512;
Ydft = fft(y1,N);
% Representacio de la transformada
figure(3)
subplot(311)
stem(n1,y1), ylabel('y1[n1]'), xlabel('n1')
title('y1[n],Y[k] and Y[k] phase for N=512'), ylabel('x[n]'), xlabel('n')
subplot(312)
stem(abs(Ydft)), ylabel('|Y[k]|'), xlabel('k')
subplot(313)
stem(angle(Ydft)), ylabel('\Phi_Y[k]'), xlabel('k')

%   Ex. 16: DFT N=512 (Original singal. No window)
N = 512;
Xdft = fft(x,N);
% Representacio de la transformada
figure(4)
subplot(311)
stem(n,x), ylabel('x[n]'), xlabel('n')
title('x[n],|Xdft[k]| and |Ydft[k]| for N=512'), ylabel('x[n]'), xlabel('n')
subplot(312)
stem(abs(Xdft)), ylabel('|Xdft[k]|'), xlabel('k')
subplot(313)
stem(abs(Ydft)), ylabel('Ydft[k]'), xlabel('k')

%   17, 18: Experimental (Use Matlab's stem GUI to mesasure)
main_lobe = 36;
sec_lobe = 8;
% Measurement of intensity level which is related to energy:
G = 20*log10(abs(main_lobe/sec_lobe)); 
fprintf("Main over secondary lobe ratio  = %.2f dB \n",G);


%% 19   DFT properties TODO

no = 10;
N = 512;
k = 0:N-1;
Ydft1=Ydft.*exp((-j*2*pi*no.*k)/N)
zn=ifft(Ydft1)
zn = zn(11:29)
figure(8)
subplot(211)
stem(zn)
subplot(212)
stem(y1)