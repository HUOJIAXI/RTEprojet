clear
clc

param
Initial=0;

A = [0 1 0 0; (Mcart+m)*m*g*l/((J+m*l^2)*(Mcart+m)-(m*l)^2) 0 0 0; 0 0 0 1; -(m*l)^2*g/((Mcart+m)*(J+m*l*l)-(m*l)^2) 0 0 0];
B = [0; -m*l/((Mcart+m)*(J+m*l*l)-m*m*l*l); 0; (J+m*l*l)/((J+m*l*l)*(Mcart+m)-m*m*l*l)];
C = [1 0 0 0; 0 0 1 0];
test=0;

observabiltyLinear
% C = [0 0 1 0];

%% Selection of Observer dynamics

% Computation of the characteristic polynomial of A
PolyCarac=poly(A); %% TBD
a0=PolyCarac(5);
a1=PolyCarac(4);
a2=PolyCarac(3);
a3=PolyCarac(2);

% direct poles selection for the observer
% Observer.poles=[-100;-120;-130]
% a0prime=-Observer.poles(1)*Observer.poles(2)*Observer.poles(3);
% a1prime=Observer.poles(1)*Observer.poles(2)+Observer.poles(1)*Observer.poles(3)+Observer.poles(2)*Observer.poles(3);
% a2prime=-Observer.poles(1)-Observer.poles(2)-Observer.poles(3);

% % computation of the poles for placement
Observer.wn=2.9*(Observer.z)/(Observer.z*Observer.tr);
% Observer.wn=6*Observer.z/(Observer.tr);
Observer.pole1= 9/Observer.tr;% tau=Controller.tr/9 pole1=1/tau (1,2/tau,1/tau^2)

Observer.poly2=[1 2*Observer.z*Observer.wn Observer.wn*Observer.wn];
Observer.poly=conv(Observer.poly2,[1 2*Observer.pole1 (Observer.pole1)^2]);
Observer.poles=roots(Observer.poly);
        
a0prime=Observer.poly(5);
a1prime=Observer.poly(4);
a2prime=Observer.poly(3);
a3prime=Observer.poly(2);

%% Observer gain
%  Observable canonical form
Ao=eig(A);%% TBD;
Co=C;%% TBD;

% Observer gain computation
% lo1=a2prime-ke*Jtot+b*L/(Jtot*L);%% TBD
% lo2=a1prime-(R*b+ke^2)/(Jtot*L)-(R*Jtot+b*L)*lo1/(Jtot*L);%% TBD
% lo3=Jtot*a0prime/k-(ke^2+b*R)/(ke*L)*lo1-R*Jtot/(ke*L)*lo2;%% TBD

lo1=a0prime-a0;
lo2=a1prime-a1;
lo3=a2prime-a2;
lo4=a3prime-a3;

% P computation
p3=C;
p2=C*(A+a3*eye(statedim));
p1=C*(A^2+a3*A+a2*eye(statedim));
p0=C*(A^3+a3*A^2+a2*A+a1*eye(statedim));
P=[p0; p1; p2; p3];
% gain for original model
disp(['Direct computation of Observer gain L gives:']);
% L_Direct=inv(P)*[lo1;lo2;lo3;lo4]
L_Direct=pinv(P).*[lo1;lo2;lo3;lo4];


% % comparison with 'place' cmd
disp(['Matlab computation of Observer gain L gives:']);
L_Matlab=place(A',C',Observer.poles)'%% TBD

% observer gains for simulation 
L=L_Matlab;
% L=L_Direct;

% state space matrices for the observer implementation in simulink
A_Obs=A;
B_Obs=[B L];
C_Obs=eye(4);
D_Obs=[0 0 0;0 0 0;0 0 0;0 0 0];
% D_Obs=[0 0;0 0;0 0;0 0];
Observer.IC=[0;0;0;0];

eig = [-1;-1.1;-1.2;-1.3];
K = place (A,B,eig)




