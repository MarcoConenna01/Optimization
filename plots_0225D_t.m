clc
clear all
load DATA.mat


f_obj_reshaped = reshape(f_obj1(:,:,37),100,100);
g1 = reshape(g1(:,:,37),100,100);
g2 = reshape(g2(:,:,37),100,100);
g3 = reshape(g3(:,:,37),100,100);
g4 = reshape(g4(:,:,37),100,100);
g5 = reshape(g5(:,:,37),100,100);
g6 = reshape(g6(:,:,37),100,100);
g7 = reshape(g7(:,:,37),100,100);

%% Plots
figure()
contour(Ln,D_t,f_obj_reshaped,100)
ylabel('Ln [m]')
xlabel('expansion ratio')
hold on
contour(Ln,D_t,g1,[0 0],'r',LineWidth=2); %thickness max
hold on
contour(Ln,D_t,g2,[0 0],'r--',LineWidth=2); %thickness min
hold on
contour(Ln,D_t,g3,[0 0],'b',LineWidth=2); %alpha min
hold on
contour(Ln,D_t,g4,[0 0],'b--',LineWidth=2); %alpha max 
hold on
contour(Ln,D_t,g5,[0 0],'g',LineWidth=2); %reynolds
hold on
contour(Ln,D_t,g6,[0 0],'k',LineWidth=2); %mass 
hold on
contour(Ln,D_t,g7,[0 0],'k--',LineWidth=2); %thrust
grid on
scatter(0.805436, 0.225)
