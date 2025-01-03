function x=sv_pL(n,L)
% Generation of a L samples pulse 
%  n: set of index wher singal is calculated
%  L: set of values where the signal is 1

% Sisco Vallverdu 2024
x = (n>=0)&(n<L);