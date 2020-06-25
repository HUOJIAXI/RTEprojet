%%%%%%%%%%%
%% Clear %%
%%%%%%%%%%%
clc; clear;

%%%%%%%%%%%%%%%%%%%%%%%%
%% Tunable parameters %%
%%%%%%%%%%%%%%%%%%%%%%%%
%% Simulink
ti=0;tf=10;Ts=0.001; % sampling period
% Noise
Noise.power=[1e-8]; %0, 1e-8, 1e-4, 1e-2
Noise.sampling=Ts;
Noise.seed=[23341];

% Testing function for derivative estimation: sinus
a=2; % amplitude 
omega=2; % pulsation

%% Select order of derivative
n=2; % order of differentiator n+1
k=1; % order of derivative estimation (k<=n !!)
L=omega^n; % Lipchitz constant 

%% Gain of 2nd ordre systeme

A=[0 1 0;
    0 2 3;
    0 4 5];
B=[0;0;2];
C=[1 0 0];

Observer.z=0.7;
Observer.tr=2;

Observer.wn=6*Observer.z/(Observer.z*Observer.tr);
Observer.pole1= 9/Observer.tr;% tau=Controller.tr/9

Observer.poly2=[1 2*Observer.z*Observer.wn Observer.wn*Observer.wn];
Observer.poly=conv(Observer.poly2,[1 Observer.pole1]);
Observer.poles=roots(Observer.poly);

L_Matlab=place(A',C',Observer.poles)';

%% Differentiator parameters
theta=2;% 0.5 2 10
%gain=[1 3]*10;
gain=[1 3 1]*10; 
% gain=L_Matlab';
% gain=[1 5 7 2]*10;
% HGD params=(n,gain, theta)
% l(i)=gain(i)*theta^(i+1) (computed in the S-function)
% HOSMD params=(n,gain, theta)
% l(i)=gain(i)*theta^(1/(n-i+1)) (computed in the S-function)
% HomD params=(n, gain, theta, alpha)
alpha=0.85; % between 1-1/(n+1),1
% l(i)=gain(i)*theta^(i) (computed in the S-function)




