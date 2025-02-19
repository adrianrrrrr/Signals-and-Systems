%   File name: rg_dft_properties.m
%   
%   Author: Adrián Ramos González. Professor(ESEIAAT-UPC). 
%   Email: adrian.ramos.gonzalez@upc.edu
%
%   Description: 
%   Lab 4 part of the Signal and Systems subject from The School of Industrial,
%   Aerospace and Audiovisual Engineering of Terrassa (ESEIAAT). 
%
%   Discrete Fourier Transform (DFT) is performed in a set of basic
%   signals. Some experiments are run to check basic properties, artifacts
%   and phenomenon happening due the mathematical characteristics of the Fourier
%   Transform when applied to discrete/digital systems (As in Matlab).
%   
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
n_old = 0:L_old-1;
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

%   Ex. 17, 18: Experimental (Use Matlab's stem() GUI to mesasure)
main_lobe = 36;
sec_lobe = 8;
% Measurement of intensity level which is related to energy:
G = 20*log10(abs(main_lobe/sec_lobe)); 
fprintf("Main over secondary lobe ratio  = %.2f dB \n",G);


%   Ex. 19: DFT properties
no = 10; % We should get a delay of 10 samples (Check theory)
N = 512;
k = 0:N-1;
Ydft1 = Ydft.*exp((-1i*2*pi*no.*k)/N);
zn = ifft(Ydft1);
y1_19 = [y1 zeros(1,no)];

figure(5)
subplot(211)
stem(zn(1:length(y1_19))), ylabel('zn[n]'), xlabel('n')
subplot(212)
stem(y1_19), ylabel('y1[n]'), xlabel('n')
title('y1[n] compared to zn[n] (Delay applied in frequency)')

%   Ex. 20: Now with no=500. length(Ydft) = 512... We shoudl expect
%   problems
no = 500; % We should get a delay of 10 samples (Check theory)
N = 512;
k = 0:N-1;
Ydft1 = Ydft.*exp((-1i*2*pi*no.*k)/N);
zn = ifft(Ydft1);
y1_19 = [y1 zeros(1,no)];

figure(6)
subplot(211)
stem(zn), ylabel('zn[n]'), xlabel('n') % This is modified to prevent crash
% We can see some cyclic nature. Signal is advanced 12 samples
subplot(212)
stem(y1_19), ylabel('y1[n]'), xlabel('n')
title('y1[n] compared to zn[n] (Delay applied in frequency)')

%   Ex. 21: 
n = 0:18;
y2 = y1.*exp((1i*2*pi*n)/4);
N = 512;
Zdft = fft(y2,N);
figure(7)
subplot(211)
stem(abs(Ydft)), ylabel('|Ydft[k]|'), xlabel('k')
title('Ydft[k] compared to Zdft[k] with negative delay applied in time ')
subplot(212)
stem(abs(Zdft)), ylabel('|Zdft[k]|'), xlabel('k')

%%   Ex. 22: Convolution property.
L = 6;
n = 0:L-1;
x = sv_pL(n,L);
y = conv(x,x);
ny = 0:2*(L-1);

figure(1)
subplot(211)
stem(n,x), ylabel('x[n]'), xlabel('n')
subplot(212)
stem(ny,y), ylabel('y[n]=x[n]*x[n]'), xlabel('n')

%   Ex. 23: With N>L. L=10 for y. 
N = 15;
X = fft(x,N);
Z = X.*X;
z = ifft(Z,N);
nz = 0:N-1;  

figure(2)
subplot(211)
stem(nz,z), ylabel('z[n]'), xlabel('n')
subplot(212)
stem(ny,y), ylabel('y[n]=x[n]*x[n]'), xlabel('n')
ax = findall(gcf, 'type', 'axes'); % Find all axes in the figure
linkaxes(ax, 'xy'); % Link both x and y axes

%   Ex. 24: Now with N=9. With N<L the signal reconstruction fails!
N = 9;
X = fft(x,N);
Z = X.*X;
z = ifft(Z,N);
nz = 0:N-1;  

figure(3)
subplot(211)
stem(nz,z), ylabel('z[n]'), xlabel('n')
subplot(212)
stem(ny,y), ylabel('y[n]=x[n]*x[n]'), xlabel('n')
ax = findall(gcf, 'type', 'axes'); % Find all axes in the figure
linkaxes(ax, 'xy'); % Link both x and y axes

% N>L is the minimum ifft length to reconstruct the signal succesfully
N = 11;
X = fft(x,N);
Z = X.*X;
z = ifft(Z,N);
nz = 0:N-1;  

figure(4)
subplot(211)
stem(nz,z), ylabel('z[n]'), xlabel('n')
subplot(212)
stem(ny,y), ylabel('y[n]=x[n]*x[n]'), xlabel('n')
ax = findall(gcf, 'type', 'axes'); % Find all axes in the figure
linkaxes(ax, 'xy'); % Link both x and y axes

%   Ex. 25-29: Theory

%%  Ex. 30: FIR LPF design by frequency sampling
clear all; close all; clc;

% DESIGN PARAMETERS
Fc = 1/4; % Cuttoff frequency (Normalized)
N = 128; % Number of coefficients a.k.a. FIR filter order

k = 0:N-1; % Vector of frequency samples 
H = ones(1,N); % Initizaliation of the filter as no filter

% Have in mind Matlab's infamous vector indexing! This is 99% of this
% design comlexity. The implementation. 
Cutoff = floor(N*Fc); % Discrete cutoff frequency
k1 = 0:Cutoff-1;
H1 = exp(-1i*pi.*k1);

Nyquist_freq = N/2; % Limit freq. 
k2 = Cutoff:Nyquist_freq-1; % Vector of samples reaching limit freq.
N2 = length(k2); % Size of samples until reaching limit freq. 
H2 = zeros(1,N2);

% Now I paste H1 and H2, then compute its complex conjugate
H3 = [H1 H2];
H4 = flip(H3);
H4 = conj(H4);
% Last step is to create the symetry 
H = [H3 H4];

figure(1)
subplot(311)
stem(k,abs(H)), ylabel('|H[k]|'), xlabel('k')
title(sprintf('H[k] designed with Fc=%1.2f and N=%d',Fc,N))
subplot(312)
stem(k,angle(H)), ylabel('\Phi_H[k]'), xlabel('k')
h = ifft(H,N);
h = abs(h); % Discarting little errors from Matlab computations
L = N;
n = 0:L-1;
subplot(313)
stem(n,h), ylabel('h[n]'), xlabel('n')

is_causal = all(H==conj(flip(H)));
if is_causal
    fprintf("The filter is causal\n")
else 
    fprintf("Non-causal filter\n")
end 

%%   Ex. 31: Now with N=4098

% DESIGN PARAMETERS
Fc = 1/4; % Cuttoff frequency (Normalized)
N = 4098; % Number of coefficients a.k.a. FIR filter order

k = 0:N-1; % Vector of frequency samples 
H = ones(1,N); % Initizaliation of the filter as no filter

% Have in mind Matlab's infamous vector indexing! This is 99% of this
% design comlexity. The implementation. 
Cutoff = floor(N*Fc); % Discrete cutoff frequency
k1 = 0:Cutoff-1;
H1 = exp(-1i*pi.*k1);

Nyquist_freq = N/2; % Limit freq. 
k2 = Cutoff:Nyquist_freq-1; % Vector of samples reaching limit freq.
N2 = length(k2); % Size of samples until reaching limit freq. 
H2 = zeros(1,N2);

% Now I paste H1 and H2, then compute its complex conjugate
H3 = [H1 H2];
H4 = flip(H3);
H4 = conj(H4);
% Last step is to create the symetry 
H = [H3 H4];

figure(2)
subplot(311)
stem(k,abs(H)), ylabel('|H[k]|'), xlabel('k')
title(sprintf('H[k] designed with Fc=%1.2f and N=%d',Fc,N))
subplot(312)
stem(k,angle(H)), ylabel('\Phi_H[k]'), xlabel('k')
h = ifft(H,N);
h = abs(h); % Discarting little errors from Matlab computations
L = N;
n = 0:L-1;
subplot(313)
stem(n,h), ylabel('h[n]'), xlabel('n')

is_causal = all(H==conj(flip(H)));
if is_causal
    fprintf("The filter is causal\n")
else 
    fprintf("Non-causal filter\n")
end 

%%  Ex. 32-33: Window applied to ideal impulse response

L = 126; % Length of the temporal window
Fc = 1/4;
n1 = -L/2:L/2;% Exercise specs
h1 = 2*Fc*sinc(2*Fc.*n1);
H1 = fft(h1);
N1 = length(H1);
k1 = 0:N1-1;

figure(3)
subplot(311)
stem(k1,abs(H1)), ylabel('|H[k]| from ideal impulse response'), xlabel('k')
title(sprintf('H[k] designed with Fc=%1.2f and N=%d',Fc,N1))
subplot(312)
stem(k1,angle(H1)), ylabel('\Phi_H[k]'), xlabel('k')
subplot(313)
stem(n1,h1), ylabel('h[n]'), xlabel('n')

% Increasing filter length, increase resolution which improve HF response
% at expenses with the must of more memory (More coeficients) == more delay
% Play with it!
% Also, freq design shows phase rotation but constant phase (causal). Time
% design has some delay by design. 

%%  Ex. 34: Parks-McClellan ideal FIR filter design
clear all; clc; 

Fc = 1/4;
[n,fo,ao,w] = firpmord([Fc Fc+0.01],[1 0],[0.001 0.01]);
b = firpm(n,fo,ao,w);
H2 = freqz(b,1,[]);
N2 = length(H2);
k2 = 0:N2-1;
h2 = ifft(H2,N2);
n2 = 0:N2-1;

figure(4)
subplot(311)
stem(k2,abs(H2)), ylabel('|H[k]| from ideal impulse response'), xlabel('k')
title(sprintf('H[k] designed with Fc=%1.2f and N=%d',Fc,N2))
subplot(312)
stem(k2,angle(H2)), ylabel('\Phi_H[k]'), xlabel('k')
subplot(313)
stem(n2,h2), ylabel('h[n]'), xlabel('n')