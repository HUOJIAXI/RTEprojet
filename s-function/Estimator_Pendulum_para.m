function  [sys, x0]  = Estimator_Pendulum_para(t,x,u,flag,g)
% inputs x, \dot x, y, \dot y, theta, \dot theta
% outputs are x,y,theta, v, omega
% y1:x y2:theta
if flag == 3 % If flag = 3, return system outputs, y

e=u(1);
de=u(2);
dde=u(3);
ddde=u(4);
y2=u(5);
dy2=u(6);
ddy2=u(7);
dddy2=u(8);
y1=u(9);
dy1=u(10);
ddy1=u(11);
dddy1=u(12);

alpha1=ddy2*cos(y2)-dy2^2*sin(y2);
alpha2=dddy2*cos(y2)-3*ddy2*dy2*sin(y2)-dy2^3*cos(y2);
beta1=ddy1*cos(y2)-g*sin(y2);


l=-3*beta1/(4*ddy2);
m=4*ddy2*(de-e)/(3*beta1*(-alpha2*ddy1+alpha1*dddy1));
M=4*((ddy1-3/4*alpha1*beta1/ddy2)*de-(dddy1-3/4*alpha2*beta1/ddy2)*e)/(3*beta1/ddy2*(-dddy1*alpha1+ddy1*alpha2));

if isnan(l)
    l=0;
end

if isnan(m)
    m=0;
end

if isnan(M)
    M=0;
end

% sys(1,1)=-3*beta1/(4*ddy2) %l
sys(1,1)=l;
sys(2,1)=m;
% sys(2,1)=4*ddy2*(de-e)/(3*beta1*(-alpha2*ddy1+alpha1*y1^3)); %m
sys(3,1)=M;
% sys(3,1)=4*((ddy1-3/4*alpha1*beta1/ddy2)*de-(dddy1-3/4*alpha2*beta1/ddy2)*e)/(3*beta1/ddy2*(-dddy1*alpha1+ddy1*alpha2));%M
% sys(3,1)=1;
% ddx=g*tan(theta)-(J+m*l*l)/(m*l*cos(theta))*(input+m*l*dtheta*dtheta*sin(theta)-(Mcart+m)*g*tan(theta))/(m*l*cos(theta)-(Mcart+m)*(J+m*l*l)/(m*l*cos(theta)));

% sys(1,1)=ddx;

elseif flag == 0 % If flag = 0, return initial condition data, sizes and x0
   %sys = [nb d'�tats continus; nb d'�tats discrets; nb de sorties; nb d'entr�es;0; 1]; 
    sys = [0; 0; 3; 12; 0; 1];  
    x0 = [];
else 
    % If flag is anything else, no need to return anything
    % since this is a continuous system
    sys = [];
end


