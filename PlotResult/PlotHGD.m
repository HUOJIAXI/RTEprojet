figure 
plot(tout,ResReel)
hold on
plot(tout,estimeout)
legend('theta_r','dtheta_r','x_r','dx_r','theta_o','dtheta_o','x_o','dx_o')
title('Observateur HGD avec la forme canonique')

