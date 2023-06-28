% %%Simplified Model%%
%design variables: wall thickness t, expansion ratio eps=Ae/At
%function to optimize = Mass/Thrust ratio
%constraints: ...

clear all
close all
clc

Parameters

%% design variables

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
g5 = zeros(length(eps),length(Ln));
g6 = zeros(length(eps),length(Ln));


for i=1:length(eps)
    for j=1:length(Ln)

        [A_e(i,j), U_e(i,j), m_dot(i,j), alpha(i,j), p_c(i,j),Thrust(i,j), Mass(i,j)] = Thrust_Mass(eps(i),Ln(j));
        [g Ceq] = simp_constraints([eps(i) Ln(j)]);
        g1(i,j) = g(1); %thickness
        g2(i,j) = g(2); %alpha min
        g3(i,j) = g(3); %alpha max
        g4(i,j) = g(4); %reynolds
        g5(i,j) = g(5); %mass
        g6(i,j) = g(6); %thrust
    end
end


Thrust_norm=Thrust./(max(Thrust,[],"all"));
Mass_norm=Mass./(max(Mass,[],"all"));
f_obj1=Mass_norm-Thrust_norm;


figure()
contour(Ln,eps,f_obj1)
xlabel('Ln [m]')
ylabel('expansion ratio')
grid on
hold on
contour(Ln,eps,g1,[0 0],'k',LineWidth=2);
hold on
contour(Ln,eps,g2,[0 0],'r--',LineWidth=2);
hold on
contour(Ln,eps,g3,[0 0],'r--',LineWidth=2);
hold on
contour(Ln,eps,g4,[0 0],'b--',LineWidth=2);
hold on
contour(Ln,eps,g5,[0 0],'g',LineWidth=2);
hold on
contour(Ln,eps,g6,[0 0],'g--',LineWidth=2);

