figure
plot(tout,ResReel)
hold on
plot(tout,ResEstimeHGD)
legend('theta_r','dtheta_r','x_r','dx_r','theta_o','dtheta_o','x_o','dx_o')
title('HGD')

figure 
plot(tout,ResReel)
hold on
plot(tout,ResEstimeHOSMD)
legend('theta_r','dtheta_r','x_r','dx_r','theta_o','dtheta_o','x_o','dx_o')
title('HOSMD')

figure 
plot(tout,ResReel)
hold on
plot(tout,ResEstimeHomD)
legend('theta_r','dtheta_r','x_r','dx_r','theta_o','dtheta_o','x_o','dx_o')
title('HomD')

