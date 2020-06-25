clear
clc

param

A = [0 1 0 0; (Mcart+m)*m*g*l/((J+m*l^2)*(Mcart+m)-(m*l)^2) 0 0 0; 0 0 0 1; -(m*l)^2*g/((Mcart+m)*(J+m*l*l)-(m*l)^2) 0 0 0];
B = [0; -m*l/((Mcart+m)*(J+m*l*l)-m*m*l*l); 0; (J+m*l*l)/((J+m*l*l)*(Mcart+m)-m*m*l*l)];
C = [0 0 1 0];

x=100;
y=5000;

Q=[x 0 0 0;
   0 0 0 0;
   0 0 y 0;
   0 0 0 0];

R = 1;

K = dlqr(A,B,Q,R);

poles = eig(A-B*K)

P = [-0.3 -0.31 -0.32 -0.33];

L = place (A',C',P)'

A_Obs=A;
B_Obs=[B L];
C_Obs=eye(4);
D_Obs=[0 0;0 0;0 0;0 0];
Observer.IC=[0;0;0;0];

