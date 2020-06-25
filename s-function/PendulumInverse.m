function  [sys, x0]  = PendulumInverse(t,x,u,flag,Mcart,m,l,g,J)
% * 6 continuous states
% * 1 inputs: u
% * 6 outputs: x1=\theta1,x2=\dot\theta1 ,x3=\theta2,x4=\dot theta2
%\dot x1    =x(2),
%\dot x2    =(-.2484e-1*sin(x(3))*x(2)^2-.5062e-1*sin(x(3))*x(2)^2*cos(x(3))-.4968e-1*sin(x(3))*x(4)*x(2)+.2208e-1*x(2)-.2484e-1*sin(x(3))*x(4)^2-.1104*delta3*x(4)-.2250*delta3*x(4)*cos(x(3))-.1104*u(1)+.1104e-1*sign(x(2))-1.733*sin(x(1))+.1104*u(2)-.5519e-2*sign(x(4))+.2250*cos(x(3))*u(2)+.4966*sin(x(1)+x(3))*cos(x(3))-.1125e-1*cos(x(3))*sign(x(4)))/((cos(x(3))+1.844)*(cos(x(3))-1.844))
%\dot x3	=x(4)
%\dot x4	=-19.76*(-.1012*sin(x(3))*x(2)^2*cos(x(3))-.3755*sin(x(3))*x(2)^2-.4968e-1*sin(x(3))*x(4)*x(2)-.1012*sin(x(3))*x(4)*x(2)*cos(x(3))+.2208e-1*x(2)+.4500e-1*x(2)*cos(x(3))-.2484e-1*sin(x(3))*x(4)^2-.5062e-1*sin(x(3))*x(4)^2*cos(x(3))-.4500*delta3*x(4)*cos(x(3))-1.669*delta3*x(4)-.1104*u(1)+.1104e-1*sign(x(2))+3.438*sin(x(1)+x(3))-1.733*sin(x(1))-.2250*cos(x(3))*u(1)+.2250e-1*cos(x(3))*sign(x(2))+.4964*sin(x(1)+x(3))*cos(x(3))-3.532*sin(x(1))*cos(x(3))+.4500*cos(x(3))*u(2)-.2250e-1*cos(x(3))*sign(x(4))+1.669*u(2)-.8343e-1*sign(x(4)))/((cos(x(3))+1.844)*(cos(x(3))-1.844))
EtatIR=[0.001; 0; 0; 0];
if abs(flag) == 1 % If flag = 1, return state derivatives, xDot
    sys(1,1)= x(2); % x1=theta x2=\dot theta
    sys(2,1)= (u+m*l*x(2)*x(2)*sin(x(1))-(Mcart+m)*g*tan(x(1)))/(m*l*cos(x(1))-(Mcart+m)*(J+m*l*l)/(m*l*cos(x(1))));
    sys(3,1) = x(4); % x3=x x=\dot x
    sys(4,1) = g*tan(x(1))-(J+m*l*l)/(m*l*cos(x(1)))*(u+m*l*x(2)*x(2)*sin(x(1))-(Mcart+m)*g*tan(x(1)))/(m*l*cos(x(1))-(Mcart+m)*(J+m*l*l)/(m*l*cos(x(1))));

elseif flag == 3 % If flag = 3, return system outputs, y
    sys(1,1) = x(1);
    sys(2,1) = x(2);
    sys(3,1) = x(3);
    sys(4,1) = x(4);
   
elseif flag == 0 % If flag = 0, return initial condition data, sizes and x0
   %sys = [nb continuous state; nb discrete state; nb ouputs; nb inputs;0; 1]; 
    sys = [4; 0; 4; 1; 0; 1]; 
    x0 = EtatIR;

else % If flag is anything else, no need to return anything
    sys = [];
end
