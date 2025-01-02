clear all; close all; clc;

%% 1 Cálculo de la DFT con la función fft() integrada en Matlab
clear all; close all; clc;
% Parametros de la señal
% Amplitudes
A = 4;
% Frecuéncias de la señal analógica
f1 = 2000; % Hz
fm = 8000;  % Hz
% Normalización de frecuéncias
Fx=f1/fm;
% Segment de L=30 mostres de senyal
L=30;
n=0:L-1;
x=A*cos(2*pi*Fx*n)

% Representació del senyal digital
figure(1)
subplot(311)
stem(n,x,"filled")
title('Representació de x[n] y su transformada'), ylabel('x[n]'), xlabel('n')
% Cálculo de la DFT
N=30;
k=0:N-1;
X=fft(x,N);
% Representacio de la transformada
subplot(312)
stem(k,abs(X)), ylabel('|X[k]|')
subplot(313)
f = k*fm/N
stem(f,abs(X))

%% 2 Cálculo de la DFT con nuestra función xx_trf()

% Representació del senyal digital
figure(2)
subplot(311)
stem(n,x,"filled")
title('Representación de x[n] y su transformada'), ylabel('x[n]'), xlabel('n')
% Cálculo de la DFT
N=30
step=1/N
frecs = 0:step:(1-2*step)
X=xx_trf(x,frecs);
% Representacio de la transformada
subplot(312)
stem(abs(X)), ylabel('|X[k]|')
subplot(313)
stem(angle(X)), ylabel('\Phi_X(F)'), xlabel('k')

%% 3 Ejercicios a partir del 11

% 11
% Parametres del senyal
% Amplituts
A = 4;
Fx=0.25; %Frequència normalitzada
% Segment de L=19 mostres
n=-9:9;
x=A*cos(2*pi*Fx*n);
% Finestra triangular
w=[1:10,9:-1:1]/10;
% Resultat d'aplicar la finestra al senyal
y=x.*w

% 12
figure(3)
% Primera posició, x[n]
subplot(311)
stem(n,x,"filled")
title('Representación de x[n],w[n] i y[n]'), ylabel('x[n]'), xlabel('n')
% Segona posició, w[n]
subplot(312)
stem(n,w), ylabel('w[n]'), xlabel('n')
% Tercera posició, y[n]
subplot(313)
stem(n,y), ylabel('y[n]'), xlabel('n')

%% 13
n1=[0:18]
y1 = y % Mateix vector, tan sols canvia index temporal

% 14
% Cálcul de la DFT
N=19
Y1=fft(y1,N)
% Representacio de la transformada
figure(5)
subplot(311)
stem(n1,y1), ylabel('y1[n1]'), xlabel('n1')
title('Representació de y[n],Y[k] i fase Y[k] per N=19'), ylabel('x[n]'), xlabel('n')
subplot(312)
stem(abs(Y1)), ylabel('|X[k]|'), xlabel('k')
subplot(313)
stem(angle(Y1)), ylabel('\Phi_X[k]'), xlabel('k')

% 15
% Cálcul de la DFT N=512 senyal enfinestrat
N=512
Ydft=fft(y1,N)
% Representacio de la transformada
figure(6)
subplot(311)
stem(n1,y1), ylabel('y1[n1]'), xlabel('n1')
title('Representació de y1[n],Y[k] i fase Y[k] per N=512'), ylabel('x[n]'), xlabel('n')
subplot(312)
stem(abs(Ydft)), ylabel('|Y[k]|'), xlabel('k')
subplot(313)
stem(angle(Ydft)), ylabel('\Phi_Y[k]'), xlabel('k')

% 16
% Cálcul de la DFT N=512 senyal sense enfinestrar
N=512
Xdft=fft(x,N)
% Representacio de la transformada
figure(7)
subplot(311)
stem(n,x), ylabel('x[n]'), xlabel('n')
title('Representació de x[n],|Xdft[k]| i |Ydft[k]| per N=512'), ylabel('x[n]'), xlabel('n')
subplot(312)
stem(abs(Xdft)), ylabel('|Xdft[k]|'), xlabel('k')
subplot(313)
stem(abs(Ydft)), ylabel('\Ydft[k]'), xlabel('k')

% 17, 18
lobul_prin = 36;
lobul_sec = 8;
G = 20*log10(lobul_prin/lobul_sec)

%% 19 Propietats de la DFT

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
