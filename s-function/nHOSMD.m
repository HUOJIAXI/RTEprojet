function  [sys, x0]  = nHOSMD(t,x,u,flag,n,gain,theta)
% Levant HOSM Differentiator
% \begin{eqnarray}
% \dot z_1 &=& v_1=z_2-\ell_1 \vert z_1 - y(t) \vert^{\frac{n}{(n+1)}} {\rm sign}(z_1 - y(t)),\\
% \dot z_2 &=&v_2=z_3 -\ell_2 \vert z_2 - v_1 \vert^{\frac{n-1}{n}} {\rm sign}(z_2 - v_1),\\
% \ldots &=& \ldots,\\
% \dot z_{n} &=& v_{n}= z_n+1 -\ell_{n} \vert z_{n} - v_{n-1} \vert^{\frac{1}{2}} {\rm sign}(z_{n} - v_{n-1}),\\
% \dot z_{n+1} &=& -\ell_n+1 {\rm sign}(z_n-v_{n-1})
% \end{eqnarray}
% ell(i)=gain(i)*theta^(1/(n-i+1))
if ne(length(gain),n+1) disp('error: gain must be a row vector of length (n+1)'); 
    else
        if flag == 1
                % If flag = 1, return state derivatives, xDot
                l=gain(1)*theta^(1/n);
                v(1)=x(2)-l*abs(x(1)-u).^(n/(n+1))*sign(x(1)-u);
                sys(1,1)=v(1);
            for i=2:n
                l(i)=gain(i)*theta^(1/(n-i+1));
                v(i)=x(i+1)-l(i)*abs(x(i)-v(i-1))^((n+1-i)/(n+2-i))*sign(x(i)-v(i-1));
                sys(i,1) = v(i);
            end
                l=gain(n+1)*theta;
                v(n+1)=-l*sign(x(n+1)-v(n));
                sys(n+1,1)=v(n+1);
        elseif flag == 3
            % If flag = 3, return system outputs, y
            for k=1:n+1
            sys(k,1)=x(k);
            end
        elseif flag == 0
            % If flag = 0, return initial condition data, sizes and x0
            %sys = [nb d'�tats continus; nb d'�tats discrets; nb de sorties; nb d'entr�es;0; 0]; 
            sys = [n+1; 0; n+1; 1; 0; 0]; 
            x0 = zeros(n+1,1);
        else
            % If flag is anything else, no need to return anything since this is a continuous system
            sys = [];
        end
end

% function  [sys, x0]  = nHOSMD(t,x,u,flag,n,gain,theta)
% % Levant HOSM Differentiator
% % \begin{eqnarray}
% % \dot z_1 &=& v_1=z_2-\ell_1 \vert z_1 - y(t) \vert^{\frac{n}{(n+1)}} {\rm sign}(z_1 - y(t)),\\
% % \dot z_2 &=&v_2=z_3 -\ell_2 \vert z_2 - v_1 \vert^{\frac{n-1}{n}} {\rm sign}(z_2 - v_1),\\
% % \ldots &=& \ldots,\\
% % \dot z_{n} &=& v_{n}= z_n+1 -\ell_{n} \vert z_{n} - v_{n-1} \vert^{\frac{1}{2}} {\rm sign}(z_{n} - v_{n-1}),\\
% % \dot z_{n+1} &=& -\ell_n+1 {\rm sign}(z_n-v_{n-1})
% % \end{eqnarray}
% % ell(i)=gain(i)*theta^(1/(n-i+1))
% if ne(length(gain),n+1) disp('error: gain must be a row vector of length (n+1)'); 
%     else
%         if flag == 1
%                 % If flag = 1, return state derivatives, xDot
% %                 l=gain(1)*theta^(1/n);
% %                 v(1)=x(2)-l*abs(x(1)-u).^(n/(n+1))*sign(x(1)-u);
% %                 sys(1,1)=v(1);
%                 v(1)=u;
%                 
%             for i=1:n
% %                 l(i)=gain(i)*theta^(1/(n-i+1));
% %                 v(i)=x(i+1)-l(i)*abs(x(i)-v(i-1))^((n+1-i)/(n+2-i))*sign(x(i)-v(i-1));
%                 v(i+1)=x(i+1)-gain(i)*theta^(1/(n-i+2))*sign(x(i)-v(i))*abs(x(i)-v(i))^((n-i+1)/(n-i+2));
%                 sys(i,1) = v(i+1);
%             end
% %                 l=gain(n+1)*theta;
% %                 v(n+1)=-l*sign(x(n+1)-v(n));
% %                 sys(n+1,1)=v(n+1);
%                   sys(n+1,1)=-gain(n+1)*theta*sign(x(n+1)-v(n+1));
%         elseif flag == 3
%             % If flag = 3, return system outputs, y
%             for k=1:n+1
%             sys(k,1)=x(k);
%             end
%         elseif flag == 0
%             % If flag = 0, return initial condition data, sizes and x0
%             %sys = [nb d'�tats continus; nb d'�tats discrets; nb de sorties; nb d'entr�es;0; 0]; 
%             sys = [n+1; 0; n+1; 1; 0; 0]; 
%             x0 = zeros(n+1,1);
%         else
%             % If flag is anything else, no need to return anything since this is a continuous system
%             sys = [];
%         end
% end
