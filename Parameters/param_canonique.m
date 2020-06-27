clear
clc
% 
% m=1;
% Mcart=5;
% l = 2;
% g = 10;
% d = 1;
ti=0;
tf=20;
test=1; % 1 for the non-lineaire model 0 for the lineaire model
Mcart = 2;
m = 0.1;
l = 0.5/2;
g = 9.8;
J=m*l^2/3;
Ts=0.001;

%% Dimension of states 

statedim=4;

%% Observer parameters
Observer.z=0.7;
Observer.tr=0.3; % 1 s su 
Observer.poles=[];

%% Noise
Noise.biais=0; %0.1, 0.5, 1, 10
Noise.power=1e-6; %1e-8, 1e-6, 1e-4, 1e-1
Noise.sampling=40*Ts;
Noise.seed=[23341];

% Testing function for derivative estimation: sinus
a=2; % amplitude 
omega=2; % pulsation

%% Select order of derivative
n=3; % order of differentiator n+1
k=2; % order of derivative estimation (k<=n !!)
L=omega^n; % Lipchitz constant 
%% Differentiator parameters
theta=10;% 0.5 2 10
%gain=[1 3]*10;
% gain=[1 3 1]*10; 
% gain=L_Matlab';
% gain=[1 5 7 2]*10;
% gain=[1 3 3 1]*10;
% HGD params=(n,gain, theta)
% l(i)=gain(i)*theta^(i+1) (computed in the S-function)
% HOSMD params=(n,gain, theta)
% l(i)=gain(i)*theta^(1/(n-i+1)) (computed in the S-function)
% HomD params=(n, gain, theta, alpha)
alpha=0.85; % between 1-1/(n+1),1
% l(i)=gain(i)*theta^(i) (computed in the S-function)
