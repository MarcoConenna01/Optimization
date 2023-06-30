% %%Complex Model%%
%design variables: wall thickness t, expansion ratio eps=Ae/At
%constraints: ...

clear variables
close all
clc

%% Design Variables
Parameters
eps = linspace(1.01,50,100);
Ln = linspace(Dc/2,1,100);
D_t = linspace(0.01,0.75*Dc,100); %CONSTRAINT REYNOLDS 100000

%% Initializing Parameters
p_c = zeros(length(eps),length(Ln),length(D_t));
A_e = zeros(length(eps),length(Ln),length(D_t));
A_t = zeros(length(eps),length(Ln),length(D_t));
D_e = zeros(length(eps),length(Ln),length(D_t));
U_e = zeros(length(eps),length(Ln),length(D_t));
m_dot = zeros(length(eps),length(Ln),length(D_t));
tg_a = zeros(length(eps),length(Ln),length(D_t));
alpha = zeros(length(eps),length(Ln),length(D_t));
Thrust = zeros(length(eps),length(Ln),length(D_t));
Mass = zeros(length(eps),length(Ln),length(D_t));
Thrust_norm = zeros(length(eps),length(Ln),length(D_t));
Mass_norm = zeros(length(eps),length(Ln),length(D_t));
t = zeros(length(eps),length(Ln),length(D_t));
g1 = zeros(length(eps),length(Ln),length(D_t));
g2 = zeros(length(eps),length(Ln),length(D_t));
g3 = zeros(length(eps),length(Ln),length(D_t));
g4 = zeros(length(eps),length(Ln),length(D_t));
g5 = zeros(length(eps),length(Ln),length(D_t));
g6 = zeros(length(eps),length(Ln),length(D_t));
g7 = zeros(length(eps),length(Ln),length(D_t));

p_ratio = P_ratio_calculator(eps,Ln,D_t);

%% Loop cycle
for k = 1:length(D_t)
    k
    for j = 1:length(Ln)
        for i = 1:length(eps)
            
            x(1) = eps(i);
            x(2) = Ln(j);
            x(3) = D_t(k);

            [A_e(k,j,i),A_t(k,j,i), U_e(k,j,i), m_dot(k,j,i), alpha(k,j,i), p_c(k,j,i),Thrust(k,j,i), Mass(k,j,i),t(k,j,i)] = Thrust_Mass(x,p_ratio(k,j,i));
            [g, Ceq] = constraints(x,p_ratio(k,j,i));

            g1(k,j,i) = g(1); %thickness max
            g2(k,j,i) = g(2); %thickness min
            g3(k,j,i) = g(3); %alpha min
            g4(k,j,i) = g(4); %alpha max 
            g5(k,j,i) = g(5); %reynolds
            g6(k,j,i) = g(6); %mass 
            g7(k,j,i) = g(7); %thrust
        end
    end
end

%% Calculate Objective Function

Thrust_norm = Thrust./max(Thrust,[],"all");
Mass_norm = Mass./max(Mass,[],"all");

f_obj1 = Mass_norm-Thrust_norm;

save DATA