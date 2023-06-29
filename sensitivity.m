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

sottraz = abs(df_deps./df_dLn);

figure()

surf(sottraz)

% Consider only the first 99x99 elements of f_obj1
f_obj1 = f_obj1(1:end-1, 1:end-1);

% Create a mask based on sottraz values
mask = sottraz < 10;

% Create a colormap for yellow and green colors
cmap = [1 1 0; 0 1 0];

% Apply the mask to f_obj1 to assign colors
f_obj1_color = zeros(size(f_obj1));
f_obj1_color(mask) = 1;

% Create the surface plot
figure
surf(f_obj1, f_obj1_color)
colormap(cmap)
colorbar