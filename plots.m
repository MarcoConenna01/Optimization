clc
clear all
load DATA.mat

Thrust_norm = Thrust./max(Thrust,[],"all");
Mass_norm = Mass./max(Mass,[],"all");
f_obj1 = Mass_norm-Thrust_norm;
test = reshape(f_obj1(42,:,:),100,100);
g1 = reshape(g1(42,:,:),100,100);
g2 = reshape(g2(42,:,:),100,100);
g3 = reshape(g3(42,:,:),100,100);
g4 = reshape(g4(42,:,:),100,100);
g5 = reshape(g5(42,:,:),100,100);
g6 = reshape(g6(42,:,:),100,100);
g7 = reshape(g7(42,:,:),100,100);

%% Plots
figure()
contour(eps,Ln,test,200)
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
scatter(14.8105, 0.30543)
