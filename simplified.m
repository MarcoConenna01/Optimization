% %%Simplified Model%%
%design variables: wall thickness t, expansion ratio eps=Ae/At
%function to optimize = Mass/Thrust ratio
%constraints: ...

clear variables
close all
clc

%% Design Variables
Parameters
eps = linspace(1.01,50,100);
Ln = linspace(Dc/2,1,100);

%% Initializing Parameters
p_ratio = zeros(length(eps),length(Ln));
p_c = zeros(length(eps),length(Ln));
A_e = zeros(length(eps),length(Ln));
D_e = zeros(length(eps),length(Ln));
U_e = zeros(length(eps),length(Ln));
m_dot = zeros(length(eps),length(Ln));
tg_a = zeros(length(eps),length(Ln));
alpha = zeros(length(eps),length(Ln));
Thrust = zeros(length(eps),length(Ln));
Mass = zeros(length(eps),length(Ln));
t = zeros(length(eps),length(Ln));
g1 = zeros(length(eps),length(Ln));
g2 = zeros(length(eps),length(Ln));
g3 = zeros(length(eps),length(Ln));
g4 = zeros(length(eps),length(Ln));
g5 = zeros(length(eps),length(Ln));
g6 = zeros(length(eps),length(Ln));
g7 = zeros(length(eps),length(Ln));

%% Loop cycle
for j = 1:length(Ln)
    for i = 1:length(eps)
        
        x(1) = eps(i);
        x(2) = Ln(j);
        [A_e(j,i), U_e(j,i), m_dot(j,i), alpha(j,i), p_c(j,i),Thrust(j,i), Mass(j,i),t(j,i)] = Thrust_Mass(x);
        [g, Ceq] = simp_constraints(x);
        g1(j,i) = g(1); %thickness max
        g2(j,i) = g(2); %thickness min
        g3(j,i) = g(3); %alpha min
        g4(j,i) = g(4); %alpha max 
        g5(j,i) = g(5); %reynolds
        g6(j,i) = g(6); %mass 
        g7(j,i) = g(7); %thrust
    end
end

%% Calculate Objective Function
Thrust_norm = Thrust./(max(Thrust,[],"all"));
Mass_norm = Mass./(max(Mass,[],"all"));
f_obj1 = Mass_norm-Thrust_norm;

%% Plots
figure()
contour(eps,Ln,f_obj1)
ylabel('Ln [m]')
xlabel('expansion ratio')
hold on
contour(eps,Ln,g1,[0 0],'r',LineWidth=2); %thickness max
hold on
contour(eps,Ln,g2,[0 0],'r--',LineWidth=2); %thickness min
hold on
contour(eps,Ln,g3,[0 0],'b',LineWidth=2); %alpha min
hold on
contour(eps,Ln,g4,[0 0],'b--',LineWidth=2); %alpha max 
hold on
contour(eps,Ln,g5,[0 0],'g',LineWidth=2); %reynolds
hold on
contour(eps,Ln,g6,[0 0],'k',LineWidth=2); %mass 
hold on
contour(eps,Ln,g7,[0 0],'k--',LineWidth=2); %thrust
grid on

%% optimization
clc
% Define the objective function
objective = @(x) Objective_function(x,max(Thrust,[],"all"),max(Mass,[],"all"));

% Define the initial guess
x0 = [40, 0.8];

% Define the nonlinear constraint function
nonlcon = @(x) simp_constraints(x);

% Define the optimization options
options = optimoptions(@fmincon, 'Display', 'iter', 'Algorithm', 'sqp','FiniteDifferenceStepSize',0.0001,'TolX', 1e-3, 'TolCon', 1e-3);

% Run the optimization
[x_opt, f_opt, exitflag, output] = fmincon(objective, x0, [], [], [], [], [], [],nonlcon, options);
scatter(x_opt(1),x_opt(2))