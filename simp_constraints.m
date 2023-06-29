function [g, Ceq]=simp_constraints(x)

eps = x(1);
Ln = x(2);

Parameters;

[A_e, U_e, m_dot, alpha,p_c Thrust, Mass] = Thrust_Mass([eps,Ln]);

amin = 10*2*pi/360;
amax = 25*2*pi/360;
Remin = 500000;
ThickMax = Ln/100;
ThickMin = 0.001;
massmax = 80;
thrustmin = 10000;

%thickness
thick = p_c.*Dc/(4*sigma); %min thickness depends on sigma
g(1) = thick/ThickMax -1;
g(2) = 1-thick/ThickMin; %min thickness for manufacturing purpose

%alpha min
g(3)=1-alpha/amin; %[10°-25°] half divergence angle

%alpha max
g(4)=alpha/amax-1;

%Reynolds
rho = 1.2471 - 0.07226*(Tc/100) - 0.003191*(Tc/100); %g/cm3
kin_visc = exp(-2.4830 + 404.28/(Tc) + 26.197*1e6/(Tc^3)); %centistokes
rho=rho*1000;
kin_visc=kin_visc*1e-6;
dyn_visc=kin_visc*rho;
Re_t=m_dot*D_t/(A_t*dyn_visc);
g(5)=1-Re_t/Remin;

%mass
g(6) = Mass/massmax-1;

%thrust
g(7) = 1-Thrust/thrustmin;

%Equality constraints
Ceq = zeros(1,7);

end
