function [z,nz]=sv_conv(x,nx,y,ny);
% Calcul de la convolucio entre dos senyals digitals
% Entrades
%   x: valors del senyal x
%   nx: conjunt d'indexs del senyal x
%   y: valors del senyal y
%   ny: conjunt d'indexs del senyal y
% Retorna:
%   z: valors del senyal z
%   nz: conjunt d'indexs del senyal z

% Sisco Vallverdu 2024

nz= (nx(1)+ny(1)):(nx(end)+ny(end));
z= conv(x,y);