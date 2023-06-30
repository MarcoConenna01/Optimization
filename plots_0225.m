clc
clear all
load DATA.mat


f_obj_reshaped = reshape(f_obj1(end,:,:),100,100);
g1 = reshape(g1(end,:,:),100,100);
g2 = reshape(g2(end,:,:),100,100);
g3 = reshape(g3(end,:,:),100,100);
g4 = reshape(g4(end,:,:),100,100);
g5 = reshape(g5(end,:,:),100,100);
g6 = reshape(g6(end,:,:),100,100);
g7 = reshape(g7(end,:,:),100,100);

%% Plots
figure()
contour(eps,Ln,f_obj_reshaped,200)
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
scatter(18.8226, 0.805436)
