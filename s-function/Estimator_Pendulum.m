
function  [sys, x0]  = Estimator_Pendulum(t,x,u,flag,Mcart,m,l,g,J)
% inputs x, \dot x, y, \dot y, theta, \dot theta
% outputs are x,y,theta, v, omega

if flag == 3 % If flag = 3, return system outputs, y

input=u(1);
theta=u(2);
dtheta=u(3);

ddx=g*tan(theta)-(J+m*l*l)/(m*l*cos(theta))*(input+m*l*dtheta*dtheta*sin(theta)-(Mcart+m)*g*tan(theta))/(m*l*cos(theta)-(Mcart+m)*(J+m*l*l)/(m*l*cos(theta)));

sys(1,1)=ddx;

elseif flag == 0 % If flag = 0, return initial condition data, sizes and x0
   %sys = [nb d'�tats continus; nb d'�tats discrets; nb de sorties; nb d'entr�es;0; 1]; 
    sys = [0; 0; 1; 3; 0; 1];  
    x0 = [];
else 
    % If flag is anything else, no need to return anything
    % since this is a continuous system
    sys = [];
end


