figure 
plot(tout,ResReel)
hold on
plot(tout,ResEstimeHomD)
% plot(tout,estimeout)
legend('theta_r','dtheta_r','x_r','dx_r','theta_o','dtheta_o','x_o','dx_o')
title('Estivateur avec la mesure de theta')

