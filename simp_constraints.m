function [g]=simp_constraints(p_c,Dc,j,sigma,alpha,T,D_t,A_t,m_flow)

%thickness
thick=p_c.*Dc*j/(2*sigma); %max thickness depends on sigma
g(1)=thick;
%alpha
g(2)=alpha; %[10°-25°] half divergence angle
%reynolds
%R=m_flow*D_t/A_t*
rho = 1.2471 - 0.07226*(T/100) - 0.003191*(T/100); %g/cm3
kin_visc = exp(-2.4830 + 404.28/(T) + 26.197*1e6/(T^3)); %centistokes
rho=rho*1000;
kin_visc=kin_visc*1e-6;
dyn_visc=kin_visc*rho;
Re_t=m_flow*D_t/(A_t*dyn_visc);
g(3)=Re_t;
end
