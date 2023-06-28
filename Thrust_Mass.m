function [A_e, U_e, m_dot, alpha, Thrust, Mass] = Thrust_Mass(eps, Ln)

        Parameters
        
        p_ratio=Expansion(eps,GAMMA,gamma); %pressure ratio
        p_c=p_e./p_ratio;
        
        Ra=R./M;
        U_e=sqrt(2*(gamma./(gamma-1)).*Ra.*Tc.*(1-r.^((gamma-1)./gamma)));

        A_e=eps.*A_t;
        
        D_e=sqrt(4/pi.*A_e);
        
        m_dot=(GAMMA.*p_c.*A_t)./(sqrt(R*Tc));
        
        tg_a=(D_e-D_t)./(2*Ln);
        alpha=atan(tg_a);
        
        Thrust=(1+cos(alpha))./2.*(m_dot.*U_e+(p_e-Pa).*A_e);
        Mass=k_loads*(rho_mat/sigma)*p_c.*(k_cyl*Vc+A_t.*(eps-1)./sin(alpha).*(Dc/2));

end