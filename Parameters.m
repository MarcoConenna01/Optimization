%% Fixed parameters

Tc=800; %Temperature in the chamber [K]
k_loads=1; %safety factor for the mass of the engine
j=1;
rho_mat=8980; %density of the material of the engine Haynes 188 [kg/m^3]
sigma=464e6; %ultimate tensile strength of material at 538°C, 946. Yield 464 [Mpa]
Dc=0.3; %diameter of the chamber [m]
k_cyl=0; %initialized value for safety factor for cylindric shape, then updated depending on geometry 
Lc=0.5; %length of the chamber [m]
Pa=101325; %ambient pressure [Pa]
%hydrazine gamma=1.25, M=32,0452g/mol
%gamma=linspace(1.15,1.30,100);
O_F=5.5;
M_o=32; %g/mol 
M_f=2;
O_F_mol=O_F*(M_f/M_o);
M=(M_o*O_F_mol+M_f*1)./(O_F_mol+1);
gamma=1.12;
GAMMA = sqrt(gamma).*(2./(gamma+1)).^((gamma+1)./(2.*(gamma-1)));
R=8314.5;

Vc=pi/4.*(Dc)^2.*Lc; %chamber volume

p_e=Pa; %adapted nozzle for simplified model (CHANGE WITH CONSTRAINTS FOR COMPLEX MODEL)
%k_cyl=1/(Lc/Dc)+2;
k_cyl=1.13;