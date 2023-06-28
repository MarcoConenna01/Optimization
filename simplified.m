clc
clear vars

%% FIXED VARIABLES

Pa = 101325; %ambient pressure in Pa
Pc = 10e5; %chamber pressure in Pa ok
Tc = 3000; %K
Dc = 0.5; %in m
Ln = 0.8;
Kloads = 1;
rho_mat = 4600; %density of the material, first example titanium
sigma = 1000e6;
SF = 1; %goes from 1.1 to 1.8
M = 32.0452;%molar mass of hydrazine
R = 8314.5/M; %8314.5 or 8.3145
gamma = 1.25;
GAMMA = sqrt(gamma)*(2/(gamma+1))^((gamma+1)/(2*(gamma-1)));

%% simplified model at altitude = 0 m. The two variables are epsilon, At


%domain for design variable, TBD, this is just a preliminary test
epsilon = 2:1:100;
At = 0.1:0.01:Dc/2;

f1 = zeros(length(epsilon),length(At));
f2 = zeros(length(epsilon),length(At));
Cf = zeros(length(epsilon),length(At));


for i = 1 : length(epsilon)
    for j = 1:length(At)

        [f1(i,j),f2(i,j),Cf(i,j)] = mass_thrust(Kloads,SF,rho_mat,sigma,At(j),epsilon(i),Dc,Pc,Tc,GAMMA,gamma,R,Pa,Ln);
       

    end
end

result = f2./f1;






