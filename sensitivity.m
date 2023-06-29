%x(1)=eps
%x(2)=Ln

clear all
clc
load DATA.mat;

h_eps = (eps(end)-eps(1))/(length(eps)-1);

h_Ln = (Ln(end)-Ln(1))/(length(Ln)-1);

df_deps = zeros(length(eps)-1,length(Ln)-1);

df_dLn = zeros(length(eps)-1,length(Ln)-1);

%FORWARD DIFFERENCES METHOD

for j = 1:(length(Ln)-1)

    for i = 1:(length(eps)-1)

        df_deps(j,i) = ((f_obj1(j,i+1)-f_obj1(j,i))/(h_eps))*eps(i)/f_obj1(j,i);

        df_dLn(j,i) = ((f_obj1(j+1,i)-f_obj1(j,i))/(h_Ln))*Ln(j)/f_obj1(j,i);

    end

end

max_df_deps = max(abs(df_deps),[],"all");

max_df_dLn = max(abs(df_dLn),[],"all");

min_df_deps = min(abs(df_deps),[],"all");

min_df_dLn = min(abs(df_dLn),[],"all");

[Ln_max_df_deps, eps_max_df_deps] = find(abs(df_deps)==max_df_deps);

[Ln_max_df_dLn, eps_max_df_dLn] = find(abs(df_dLn)==max_df_dLn);

[Ln_min_df_deps, eps_min_df_deps] = find(abs(df_deps)==min_df_deps);

[Ln_min_df_dLn, eps_min_df_dLn] = find(abs(df_dLn)==min_df_dLn);

ratio = abs(df_deps./df_dLn);

figure()

surf(ratio)

% % Consider only the first 99x99 elements of f_obj1
% f_obj1 = f_obj1(1:end-1, 1:end-1);
% 
% % Create a mask for values above 10
% mask_yellow = ratio > 10;
% 
% % Create a mask for values below 0.1
% mask_red = ratio < 0.1;
% 
% % Create a colormap for yellow, red, and green colors
% cmap = [1 1 0; 1 0 0; 0 1 0];
% 
% % Initialize f_obj1_color with green color
% f_obj1_color = zeros(size(f_obj1));
% 
% % Set yellow color for values above 10
% f_obj1_color(mask_yellow) = 1;
% 
% % Set red color for values below 0.1
% f_obj1_color(mask_red) = 2;
% 
% % Create the surface plot
% figure
% surf(f_obj1, f_obj1_color)
% colormap(cmap)
% colorbar

% Consider only the first 99x99 elements of f_obj1
f_obj1 = f_obj1(1:end-1, 1:end-1);

% Create a mask for values above 10
mask_yellow = ratio > 100;

% Create a mask for values below 0.1
mask_red = ratio < 0.01;

% Create a colormap for yellow, red, and green colors
cmap = [1 1 0; 1 0 0; 0 1 0];

% Initialize f_obj1_color with green color
f_obj1_color = zeros(size(f_obj1));

% Set yellow color for values above 10
f_obj1_color(mask_yellow) = 1;

% Set red color for values below 0.1
f_obj1_color(mask_red) = 2;

% Create the contour plot
figure
contourf(eps(1:end-1),Ln(1:end-1),f_obj1)
colormap(cmap)
colorbar
hold on

% Overlay the colored regions
[rows, cols] = find(f_obj1_color > 0);
for i = 1:numel(rows)
    plot(cols(i), rows(i), 'marker', '.', 'color', cmap(f_obj1_color(rows(i), cols(i)), :), 'markersize', 20)
end

hold off