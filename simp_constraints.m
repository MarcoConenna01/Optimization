function [g Ceq]=simp_constraints(x)

eps = x(1);
Ln = x(2);

Parameters
[A_e, U_e, m_dot, alpha, Thrust, Mass] = Thrust_mass(eps,Ln);

amin = 10*2*pi/360;
amax = 25*2*pi/360;
Remin = 500000;
ThickMax = Ln/10;
massmax = 1000;
thrustmin = 10000;

%thickness
thick = p_c.*Dc/(4*sigma); %max thickness depends on sigma
g(1) = thick - ThickMax;

%alpha min
g(2)=amin-alpha; %[10°-25°] half divergence angle

%alpha max
g(3)=alpha-amax;

%Reynolds
rho = 1.2471 - 0.07226*(T/100) - 0.003191*(T/100); %g/cm3
kin_visc = exp(-2.4830 + 404.28/(T) + 26.197*1e6/(T^3)); %centistokes
rho=rho*1000;
kin_visc=kin_visc*1e-6;
dyn_visc=kin_visc*rho;
Re_t=m_flow*D_t/(A_t*dyn_visc);
g(4)=Remin-Re_t;

%mass
g(5) = mass-massmax;

%thrust
g(6) = thrustmin-thrust;

%Equality constraints
Ceq = [];
end
