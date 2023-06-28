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
%gamma=linspace(1.15,1.30,100);
gamma=1.25;
GAMMA = sqrt(gamma).*(2./(gamma+1)).^((gamma+1)./(2.*(gamma-1)));
M=32.0452;
R=8314.5;



Vc=pi/4.*(Dc)^2.*Lc; %chamber volume

p_e=Pa; %adapted nozzle for simplified model (CHANGE WITH CONSTRAINTS FOR COMPLEX MODEL)
%k_cyl=1/(Lc/Dc)+2;
k_cyl=1.13;
%% design variables
%p_ratio=0.0001:0.0001:0.01;
D_t=0.1; %design variable fro complex model
A_t=pi/4.*(D_t).^2;

eps=1:1:100;
Ln=linspace(D_t/2,1,100);

p_ratio=zeros(length(eps),length(Ln));
p_c=zeros(length(eps),length(Ln));
A_e=zeros(length(eps),length(Ln));
D_e=zeros(length(eps),length(Ln));
U_e=zeros(length(eps),length(Ln));
m_dot=zeros(length(eps),length(Ln));
tg_a=zeros(length(eps),length(Ln));
alpha=zeros(length(eps),length(Ln));
Thrust=zeros(length(eps),length(Ln));
Mass=zeros(length(eps),length(Ln));

for i=1:length(eps)
p_ratio(i,:)=expansion(eps(i),GAMMA,gamma); %pressure ratio

p_c(i,:)=p_e./p_ratio(i,:);
end


for i=1:length(eps)
    for j=1:length(Ln)



        A_e(i,j)=eps(i).*A_t;
        
        D_e(i,j)=sqrt(4/pi.*A_e(i,j));
        
        U_e(i,j)=ex_vel(gamma,R,M,Tc,p_ratio(i,j));
        
        m_dot(i,j)=m_flow_rate(p_c(i,j),A_t,GAMMA,R,Tc);
        tg_a(i,j)=(D_e(i,j)-D_t)./(2*Ln(j));
        alpha(i,j)=atan(tg_a(i,j));
        
        t(i,j)=p_c(i,j)*Dc*j/(2*sigma);
        Thrust(i,j)=(1+cos(alpha(i,j)))./2.*(m_dot(i,j).*U_e(i,j)+(p_e-Pa).*A_e(i,j));
        Mass(i,j)=k_loads*(rho_mat/sigma)*j.*p_c(i,j).*(k_cyl*Vc+A_t.*(eps(i)-1)./sin(alpha(i,j)).*(Dc/2));
    end
end
w=1;
Thrust_norm=Thrust./(max(Thrust,[],"all"));
Mass_norm=Mass./(max(Mass,[],"all"));
f_obj1=Mass_norm-w.*Thrust_norm;
%f_obj2=Mass_norm./(Thrust_norm);
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
surf(f_obj1)
title('fobj sottraz')
figure()
contour(f_obj1)



%% functions

% function epsilon=exp_ratio(r,g,G)
% epsilon=G./(sqrt((2*g./g-1).*r.^(2./g).*(1-r.^((g-1)./g))));
% end

function p_ratio = expansion(eps,GAMMA,gamma)

zero = @(x) abs(eps - GAMMA/(sqrt((2*gamma/(gamma-1))*x^(2/gamma)*(1-x^((gamma-1)/gamma)))));
options = optimoptions("fmincon","Algorithm","sqp");
p_ratio = fmincon(zero,0.5,[],[],[],[],0,1,[],options);

end

function ue=ex_vel(g,R,M,T,r)
%r=p_e./p_c;
Ra=R./M;
ue=sqrt(2*(g./(g-1)).*Ra.*T.*(1-r.^((g-1)./g)));
end

function m_dot=m_flow_rate(p_c,A_t,G,R,T)

m_dot=(G.*p_c.*A_t)./(sqrt(R*T));

end



