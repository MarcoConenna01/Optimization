%x(1)=eps
%x(2)=Ln
% 
% clear all
% clc
load DATA.mat;

h_eps = (eps(end)-eps(1))/(length(eps)-1);

h_Ln = (Ln(end)-Ln(1))/(length(Ln)-1);

df_deps = zeros(length(eps)-1,length(Ln)-1);

df_dLn = zeros(length(eps)-1,length(Ln)-1);

%FORWARD DIFFERENCES METHOD

tic; 

for j = 1:(length(Ln)-1)

    for i = 1:(length(eps)-1)
        
        df_deps(j,i) = ((f_obj1(j,i+1)-f_obj1(j,i))/(h_eps)); %*eps(i)/f_obj1(j,i);

        df_dLn(j,i) = ((f_obj1(j+1,i)-f_obj1(j,i))/(h_Ln)); %*Ln(j)/f_obj1(j,i);
    
    end

end

toc;

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

%% plots
close all;
figure();
for i=1:10:length(Ln)-1
plot(eps(1:end-1),df_deps(i,:),'r', 'Linewidth',1.2)
hold on
grid on
title('Sensitivity df/dx_1')
xlabel('x_1')
ylabel('df/dx_1')
end
% Add arrow annotation for increasing Ln values
x_start = 0.6;  % x-coordinate of the starting point of the arrow
y_start = 0.2;  % y-coordinate of the starting point of the arrow
x_end = 0.8;  % x-coordinate of the ending point of the arrow
y_end = 0.97;  % y-coordinate of the ending point of the arrow

% Calculate the slope of the arrow
slope = (y_end - y_start) / (x_end - x_start);

% Set the length of the arrow
arrow_length = 0.1;

% Calculate the ending point coordinates based on the desired arrow length
x_arrow_end = x_end - arrow_length / sqrt(1 + slope^2);
y_arrow_end = y_end - slope * arrow_length / sqrt(1 + slope^2);

% Add arrow annotation with increased linewidth
arrow_h = annotation('arrow', [x_start, x_arrow_end], [y_start, y_arrow_end]);
arrow_h.LineWidth = 1.5;
% Adjust text position relative to the arrow


% Create a dummy plot for the legend arrow
dummy_plot = plot(NaN, NaN, 'Color', 'none', 'LineWidth', 2);
hold on;

% Create a separate axes for the legend
legend_axes = axes('Position', [0.5, 0.2, 0.2, 0.2], 'Visible', 'off');
box(legend_axes, 'on');  % Add a box around the legend
% Add the legend text
legend_text = 'Increasing x_2';
text(0.1, 0.99, legend_text, 'HorizontalAlignment', 'center', 'VerticalAlignment', 'middle', 'FontSize', 10, 'FontWeight', 'bold');

% Adjust the legend box properties
legend_title = 'Legend';
legend(legend_axes, 'off');  % Turn off the default legend
legend_axes.Title.String = legend_title;
legend_axes.Title.FontWeight = 'bold';

% Adjust the legend box position and size as desired
legend_axes.Position = [0.8, 0.8, 0.1, 0.1];

figure();
for i=1:10:length(eps)-1
plot(Ln(1:end-1),df_dLn(:,i),'r', 'Linewidth',1.2)
hold on
grid on
title('Sensitivity df/dx_2')
xlabel('x_2')
ylabel('df/dx_2')
end
% Add arrow annotation for increasing Ln values
x_start = 0.5;  % x-coordinate of the starting point of the arrow
y_start = 0.3;  % y-coordinate of the starting point of the arrow
x_end = 0.9;  % x-coordinate of the ending point of the arrow
y_end = 0.97;  % y-coordinate of the ending point of the arrow

% Calculate the slope of the arrow
slope = (y_end - y_start) / (x_end - x_start);

% Set the length of the arrow
arrow_length = 0.1;

% Calculate the ending point coordinates based on the desired arrow length
x_arrow_end = x_end - arrow_length / sqrt(1 + slope^2);
y_arrow_end = y_end - slope * arrow_length / sqrt(1 + slope^2);

% Add arrow annotation with increased linewidth
arrow_h = annotation('arrow', [x_start, x_arrow_end], [y_start, y_arrow_end]);
arrow_h.LineWidth = 1.5;
% Adjust text position relative to the arrow


% Create a dummy plot for the legend arrow
dummy_plot = plot(NaN, NaN, 'Color', 'none', 'LineWidth', 2);
hold on;

% Create a separate axes for the legend
legend_axes = axes('Position', [0.5, 0.2, 0.2, 0.2], 'Visible', 'off');
box(legend_axes, 'on');  % Add a box around the legend
% Add the legend text
legend_text = 'Decreasing x_1';
text(0.1, 0.99, legend_text, 'HorizontalAlignment', 'center', 'VerticalAlignment', 'middle', 'FontSize', 10, 'FontWeight', 'bold');

% Adjust the legend box properties
legend_title = 'Legend';
legend(legend_axes, 'off');  % Turn off the default legend
legend_axes.Title.String = legend_title;
legend_axes.Title.FontWeight = 'bold';

% Adjust the legend box position and size as desired
legend_axes.Position = [0.8, 0.8, 0.1, 0.1];

%%

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