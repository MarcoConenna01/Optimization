clc
clear all
close all
load DATA.mat
load x_opt.mat

%% fixed x1
f_obj_reshaped = reshape(f_obj1(:,:,37),100,100);
g1 = reshape(g1(:,:,37),100,100);
g2 = reshape(g2(:,:,37),100,100);
g3 = reshape(g3(:,:,37),100,100);
g4 = reshape(g4(:,:,37),100,100);
g5 = reshape(g5(:,:,37),100,100);
g6 = reshape(g6(:,:,37),100,100);
g7 = reshape(g7(:,:,37),100,100);
g8 = reshape(g8(:,:,37),100,100);


figure()
contour(Ln,D_t,f_obj_reshaped,70)
xlabel('Ln [m] (x_2)')
ylabel('Throat Diameter D_t (x_3)')
title('Optimum, with x_1=x_{opt}(1)=18.356')
hold on
contour(Ln,D_t,g1,[0 0],'r',LineWidth=2); %thickness max
hold on
contour(Ln,D_t,g2,[0 0],'g',LineWidth=2); %thickness min
hold on
contour(Ln,D_t,g3,[0 0],'b',LineWidth=2); %alpha min
hold on
contour(Ln,D_t,g4,[0 0],'m',LineWidth=2); %alpha max 
hold on
contour(Ln,D_t,g5,[0 0],'c',LineWidth=2); %reynolds
hold on
contour(Ln,D_t,g6,[0 0],'k',LineWidth=2); %mass 
hold on
contour(Ln,D_t,g7,[0 0],'y',LineWidth=2); %thrust
hold on
% contour(Ln,D_t,g8,[0 0],'--k',LineWidth=2); %thrust
% hold on
% contour(eps,Ln,g1,[0.2 0.2],'--r',LineWidth=2); %thickness max
% hold on
% contour(eps,Ln,g2,[0.2 0.2],'--g',LineWidth=2); %thickness min
% hold on
% contour(eps,Ln,g3,[0.2 0.2],'--b',LineWidth=2); %alpha min
% hold on
% contour(eps,Ln,g4,[0.2 0.2],'--m',LineWidth=2); %alpha max 
% hold on
% contour(eps,Ln,g5,[0.2 0.2],'--c',LineWidth=2); %reynolds
% hold on
% contour(eps,Ln,g6,[0.2 0.2],'--k',LineWidth=2); %mass 
% hold on
% contour(eps,Ln,g7,[0.2 0.2],'--y',LineWidth=2); %thrust
% hold on
% contour(eps,Ln,g8,[0.2 0.2],'--k',LineWidth=2); %thrust
grid on
scatter(0.802,x_opt(3),'*r')
legend('f obj','g1','g2','g3','g4','g5','g6','g7','g8','','','','','','','','','x opt')
colorbar

cb = colorbar;

title(cb, 'f obj');

%% fixed x2

clc
clear all
load DATA.mat
load x_opt.mat

f_obj_reshaped = reshape(f_obj1(:,76,:),100,100);
g1 = reshape(g1(:,76,:),100,100);
g2 = reshape(g2(:,76,:),100,100);
g3 = reshape(g3(:,76,:),100,100);
g4 = reshape(g4(:,76,:),100,100);
g5 = reshape(g5(:,76,:),100,100);
g6 = reshape(g6(:,76,:),100,100);
g7 = reshape(g7(:,76,:),100,100);
g8 = reshape(g8(:,76,:),100,100);


figure()
contour(eps,D_t,f_obj_reshaped,70)
xlabel('Expansion ratio (x_1)')
ylabel('Throat Diameter D_t (x_3)')
title('Optimum, with x_2=x_{opt}(2)=0.7924')
hold on
contour(eps,D_t,g1,[0 0],'r',LineWidth=2); %thickness max
hold on
contour(eps,D_t,g2,[0 0],'g',LineWidth=2); %thickness min
hold on
contour(eps,D_t,g3,[0 0],'b',LineWidth=2); %alpha min
hold on
contour(eps,D_t,g4,[0 0],'m',LineWidth=2); %alpha max 
hold on
contour(eps,D_t,g5,[0 0],'c',LineWidth=2); %reynolds
hold on
contour(eps,D_t,g6,[0 0],'k',LineWidth=2); %mass 
hold on
contour(eps,D_t,g7,[0 0],'y',LineWidth=2); %thrust
hold on
% contour(eps,D_t,g8,[0 0],'--k',LineWidth=2); %thrust
% hold on
% contour(eps,Ln,g1,[0.2 0.2],'--r',LineWidth=2); %thickness max
% hold on
% contour(eps,Ln,g2,[0.2 0.2],'--g',LineWidth=2); %thickness min
% hold on
% contour(eps,Ln,g3,[0.2 0.2],'--b',LineWidth=2); %alpha min
% hold on
% contour(eps,Ln,g4,[0.2 0.2],'--m',LineWidth=2); %alpha max 
% hold on
% contour(eps,Ln,g5,[0.2 0.2],'--c',LineWidth=2); %reynolds
% hold on
% contour(eps,Ln,g6,[0.2 0.2],'--k',LineWidth=2); %mass 
% hold on
% contour(eps,Ln,g7,[0.2 0.2],'--y',LineWidth=2); %thrust
% hold on
% contour(eps,Ln,g8,[0.2 0.2],'--k',LineWidth=2); %thrust
grid on
scatter(x_opt(1),x_opt(3),'*r')
legend('f obj','g1','g2','g3','g4','g5','g6','g7','g8','','','','','','','','','x opt')
colorbar

cb = colorbar;

title(cb, 'f obj');

%% fixed x3

clc
clear all
load DATA.mat
load x_opt.mat

f_obj_reshaped = reshape(f_obj1(75,:,:),100,100);
g1 = reshape(g1(75,:,:),100,100);
g2 = reshape(g2(75,:,:),100,100);
g3 = reshape(g3(75,:,:),100,100);
g4 = reshape(g4(75,:,:),100,100);
g5 = reshape(g5(75,:,:),100,100);
g6 = reshape(g6(75,:,:),100,100);
g7 = reshape(g7(75,:,:),100,100);
g8 = reshape(g8(75,:,:),100,100);


figure()
contour(eps,Ln,f_obj_reshaped,70)
xlabel('Expansion ratio (x_1)')
ylabel('Nozzle Length Ln (x_2)')
title('Optimum, with x_3=x_{opt}(3)=0.225')
hold on
contour(eps,Ln,g1,[0 0],'r',LineWidth=2); %thickness max
hold on
contour(eps,Ln,g2,[0 0],'g',LineWidth=2); %thickness min
hold on
contour(eps,Ln,g3,[0 0],'b',LineWidth=2); %alpha min
hold on
contour(eps,Ln,g4,[0 0],'m',LineWidth=2); %alpha max 
hold on
contour(eps,Ln,g5,[0 0],'c',LineWidth=2); %reynolds
hold on
contour(eps,Ln,g6,[0 0],'k',LineWidth=2); %mass 
hold on
contour(eps,Ln,g7,[0 0],'y',LineWidth=2); %thrust
hold on
contour(eps,Ln,g8,[0 0],'k',LineWidth=2); %thrust
hold on
% contour(eps,Ln,g1,[0.2 0.2],'--r',LineWidth=2); %thickness max
% hold on
% contour(eps,Ln,g2,[0.2 0.2],'--g',LineWidth=2); %thickness min
% hold on
% contour(eps,Ln,g3,[0.2 0.2],'--b',LineWidth=2); %alpha min
% hold on
% contour(eps,Ln,g4,[0.2 0.2],'--m',LineWidth=2); %alpha max 
% hold on
% contour(eps,Ln,g5,[0.2 0.2],'--c',LineWidth=2); %reynolds
% hold on
% contour(eps,Ln,g6,[0.2 0.2],'--k',LineWidth=2); %mass 
% hold on
% contour(eps,Ln,g7,[0.2 0.2],'--y',LineWidth=2); %thrust
% hold on
% contour(eps,Ln,g8,[0.2 0.2],'--k',LineWidth=2); %thrust
grid on
scatter(x_opt(1),x_opt(2),'*r')
legend('f obj','g1','g2','g3','g4','g5','g6','g7','g8','','','','','','','','','x opt')
colorbar

cb = colorbar;

title(cb, 'f obj');
