function [A_e, A_t, U_e, m_dot, alpha,p_c, Thrust, Mass,t] = Thrust_Mass2(x)

        eps = x(1);
        Ln = x(2);
        D_t = x(3);
        
        A_t = pi/4.*(D_t).^2;
        Parameters;
        
        gamma=1.12;

        p_ratio = Expansion(eps,GAMMA,gamma);
        
        p_c=p_e./p_ratio;
        
        Ra=R./M;
        U_e=sqrt(2*(gamma/(gamma-1)).*Ra.*Tc.*(1-p_ratio.^((gamma-1)/gamma)));

        A_e=eps.*A_t;
        
        D_e=sqrt(4/pi.*A_e);
        
        m_dot=(GAMMA.*p_c.*A_t)./(sqrt(R*Tc));
        
        tg_a=(D_e-D_t)./(2*Ln);
        alpha=atan(tg_a);
        
        Thrust=(1+cos(alpha))./2.*(m_dot.*U_e+(p_e-Pa).*A_e);
        Mass=k_loads*(rho_mat/sigma)*p_c.*(k_cyl*Vc+A_t.*(eps-1)./sin(alpha).*(Dc/2));

        t = p_c.*Dc/(2*sigma);
end