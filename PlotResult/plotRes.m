figure(1)
plot(out.tout,out.ResReel)
hold on
plot(out.tout,out.ResEstime)
legend('theta_r','dtheta_r','x_r','dx_r','theta_o','dtheta_o','x_o','dx_o')

figure(2)
plot(out.tout,out.ResEstime(:,1),out.tout,out.ResReel(:,1))
title('theta')

figure(3)
plot(out.tout,out.ResEstime(:,2),out.tout,out.ResReel(:,2))
title('dtheta')

figure(4)
plot(out.tout,out.ResEstime(:,3),out.tout,out.ResReel(:,3))
title('x')

figure(5)
plot(out.tout,out.ResEstime(:,4),out.tout,out.ResReel(:,4))
title('dx')