figure(1)
plot(tout,ResReel)
hold on
plot(tout,ResEstime)
legend('theta_r','dtheta_r','x_r','dx_r','theta_o','dtheta_o','x_o','dx_o')

figure(2)
plot(tout,ResEstime(:,1),tout,ResReel(:,1))
title('theta')

figure(3)
plot(tout,ResEstime(:,2),tout,ResReel(:,2))
title('dtheta')

figure(4)
plot(tout,ResEstime(:,3),tout,ResReel(:,3))
title('x')

figure(5)
plot(tout,ResEstime(:,4),tout,ResReel(:,4))
title('dx')