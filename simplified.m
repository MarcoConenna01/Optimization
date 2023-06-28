%%Simplified Model%%
%design variables: wall thickness t, expansion ratio eps=Ae/At
%function to optimize = Mass/Thrust ratio
%constraints: ...

clear all
close all
clc

%% Fixed parameters
Tc=800; %Temperature in the chamber [K]
k_loads=1; %safety factor for the mass of the engine
j=1.1;
rho_mat=8980; %density of the material of the engine Haynes 188 [kg/m^3]
sigma=7480; %ultimate tensile strength of material at 538°C, [bar]
Dc=0.5; %diameter of the chamber [m]
k_cyl=0; %initialized value for safety factor for cylindric shape, then updated depending on geometry 
Lc=0.5; %length of the chamber [m]
Pa=1.01325; %ambient pressure [bar]
%hydrazine gamma=1.25, M=32,0452g/mol
gamma=linspace(1.15,1.30,100);
GAMMA = sqrt(gamma).*(2./(gamma+1)).^((gamma+1)./(2.*(gamma-1)));
M=32.0452;
R=8314.5;
Ln=0.7;

Vc=pi/4.*(Dc)^2.*Lc; %chamber volume

p_e=Pa*1.2;
%k_cyl=1/(Lc/Dc)+2;
k_cyl=1.13;
%% design variables
p_ratio=0.0001:0.0001:0.01;
%D_t=linspace(0.05,0.5,100);
D_t=0.4;
A_t=pi/4.*(D_t).^2;


eps=exp_ratio(p_ratio,gamma,GAMMA);
A_e=eps.*A_t;
D_e=sqrt(4/pi.*A_e);
U_e=ex_vel(gamma,R,M,Tc,p_ratio);
p_c=p_e./p_ratio;
m_dot=m_flow_rate(p_c,A_t,GAMMA,R,Tc);

tg_a=(D_e-D_t)./(2*Ln);
alpha=atan(tg_a);
for i=1:length(p_ratio)
    for j=1:length(gamma)
Thrust(i,j)=m_dot(i,j).*U_e(i,j)+(p_e-Pa).*A_e(i,j);
Mass(i,j)=k_loads*(rho_mat/sigma)*j.*p_c(i).*(k_cyl*Vc+A_t.*(eps(i,j)-1)./sin(alpha(i,j)).*(Dc/2));
    end
end
%figure()
%plot(p_c,Mass)
surf(Mass)
title('mass')
figure()
%plot(p_c,Thrust,'r',p_c,Mass./1e02,'b')
surf(Thrust)
title('Thrust')
%legend('thrust','mass')
figure()
%plot(p_c,Mass./Thrust)
surf(Mass.*1e-2./Thrust)
title('fobj')
%figure()
%plot(p_ratio,U_e)
%% calculations




%% functions

% function epsilon=exp_ratio(r,g,G)
% epsilon=G./(sqrt((2*g./g-1).*r.^(2./g).*(1-r.^((g-1)./g))));
% end

function epsilon=exp_ratio(r,g,G)
for i=1:length(r)
    for j=1:length(g)
epsilon(i,j)=G(j)./(sqrt((2*g(j)./g(j)-1).*r(i).^(2./g(j)).*(1-r(i).^((g(j)-1)./g(j)))));
    end
end
end

function ue=ex_vel(g,R,M,T,r)
%r=p_e./p_c;
Ra=R./M;
for i=1:length(r)
    for j=1:length(g)
ue(i,j)=sqrt(2*(g(j)./(g(j)-1)).*Ra.*T.*(1-r(i).^((g(j)-1)./g(j))));
    end
end
end

function m_dot=m_flow_rate(p_c,A_t,G,R,T)
for i=1:length(p_c)
    for j=1:length(G)
m_dot(i,j)=(G(j).*p_c(i).*A_t)./(sqrt(R*T));
    end
end
end



