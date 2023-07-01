%% Fixed parameters

Tc=800; %Temperature in the chamber [K]
k_loads=1; %safety factor for the mass of the engine
rho_mat=8980; %density of the material of the engine Haynes 188 [kg/m^3]
sigma=464e6; %ultimate tensile strength of material at 538°C, 946. Yield 464 [Mpa]
Dc=0.3; %diameter of the chamber [m]
Lc=0.5; %length of the chamber [m]
Pa=101325; %ambient pressure [Pa]
O_F=5.5;
M_o=32; %g/mol 
M_f=2; %g/mol
O_F_mol=O_F*(M_f/M_o);
M=(M_o*O_F_mol+M_f*1)./(O_F_mol+1);
gamma=1.12;
GAMMA = sqrt(gamma).*(2./(gamma+1)).^((gamma+1)./(2.*(gamma-1)));
R=8314.5;

Vc=pi/4.*(Dc)^2.*Lc; %chamber volume

p_e=Pa; %adapted nozzle for simplified model (CHANGE WITH CONSTRAINTS FOR COMPLEX MODEL)

k_cyl=1.13; %safety factor for cylindric shape

D_t=0.1; %design variable for complex model
A_t=pi/4.*(D_t).^2;