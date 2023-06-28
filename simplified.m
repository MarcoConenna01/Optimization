% %%Simplified Model%%
%design variables: wall thickness t, expansion ratio eps=Ae/At
%function to optimize = Mass/Thrust ratio
%constraints: ...

clear all
close all
clc

%% Fixed parameters
Tc=800; %Temperature in the chamber [K]
k_loads=1; %safety factor for the mass of the engine
j=1;
rho_mat=8980; %density of the material of the engine Haynes 188 [kg/m^3]
sigma=1260e6; %ultimate tensile strength of material at 538°C, [bar]
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
%% design variables
%p_ratio=0.0001:0.0001:0.01;
D_t=0.1; %design variable for complex model
A_t=pi/4.*(D_t).^2;

eps=linspace(1,50,100);
Ln=linspace(Dc/2,1,100);

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
t = zeros(length(eps),length(Ln));
g1 = zeros(length(eps),length(Ln));
g2 = zeros(length(eps),length(Ln));
g3 = zeros(length(eps),length(Ln));
g4 = zeros(length(eps),length(Ln));

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
        
        Thrust(i,j)=(1+cos(alpha(i,j)))./2.*(m_dot(i,j).*U_e(i,j)+(p_e-Pa).*A_e(i,j));
        Mass(i,j)=k_loads*(rho_mat/sigma)*j.*p_c(i,j).*(k_cyl*Vc+A_t.*(eps(i)-1)./sin(alpha(i,j)).*(Dc/2));

        g = simp_constraints(p_c(i,j),Dc,j,sigma,alpha(i,j),Tc,D_t,A_t,m_dot(i,j),A_e(i,j),Pa,Thrust(i,j));
        g1(i,j) = g(1);
        g2(i,j) = g(2);
        g3(i,j) = g(3);
        g4(i,j) = g(4);
    end
end

Thrust_norm=Thrust./(max(Thrust,[],"all"));
Mass_norm=Mass./(max(Mass,[],"all"));
f_obj1=Mass_norm-Thrust_norm;

% surf(Mass)
% title('mass')
% 
% figure()
% surf(Thrust)
% title('Thrust')
% 
% figure()
% surf(f_obj1)
% title('fobj sottraz')

amin = 10*2*pi/360;
amax = 25*2*pi/360;
Remin = 500000;
thicknessMatrix = zeros(100,100);
massmax = 1000;
thrustmin = 10000;

for i=1:100
    thicknessMatrix(i,:) = Ln/10;
end

thicknessMatrix = thicknessMatrix-g1;

figure()
contour(Ln,eps,f_obj1)
xlabel('Ln [m]')
ylabel('expansion ratio')
grid on
hold on
contour(Ln,eps,thicknessMatrix,[0 0],'k',LineWidth=2);
hold on
% contour(Ln,eps,thicknessMatrix,[0.01 0.01],'k--',LineWidth=2);
hold on
contour(Ln,eps,g2-amin,[0 0],'r--',LineWidth=2);
hold on
contour(Ln,eps,g2-amax,[0 0],'r--',LineWidth=2);
hold on
contour(Ln,eps,g3-Remin,[0 0],'b--',LineWidth=2);
hold on
contour(Ln,eps,Mass-massmax,[0 0],'g*',LineWidth=2);
hold on
contour(Ln,eps,Thrust-thrustmin,[0 0],'g--',LineWidth=2);

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



