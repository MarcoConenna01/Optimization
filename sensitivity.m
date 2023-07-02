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
        
        df_deps(j,i) = ((f_obj1(j,i+1)-f_obj1(j,i))/(h_eps))*eps(i)/f_obj1(j,i);
d
        df_dLn(j,i) = ((f_obj1(j+1,i)-f_obj1(j,i))/(h_Ln))*Ln(j)/f_obj1(j,i);
    
    end

end

toc;


% max_df_deps = max(abs(df_deps),[],"all");
% 
% max_df_dLn = max(abs(df_dLn),[],"all");
% 
% min_df_deps = min(abs(df_deps),[],"all");
% 
% min_df_dLn = min(abs(df_dLn),[],"all");
% 
% [Ln_max_df_deps, eps_max_df_deps] = find(abs(df_deps)==max_df_deps);
% 
% [Ln_max_df_dLn, eps_max_df_dLn] = find(abs(df_dLn)==max_df_dLn);
% 
% [Ln_min_df_deps, eps_min_df_deps] = find(abs(df_deps)==min_df_deps);
% 
% [Ln_min_df_dLn, eps_min_df_dLn] = find(abs(df_dLn)==min_df_dLn);

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
[J I V]=find(ratio>10)
fill_red=[J I];
[J_y I_y V_y]=find(ratio< 0.01)
fill_yellow=[J_y I_y];

for i=1:length(fill_red)
    x_red(i)=eps(fill_red(i,2));
    y_red(i)=Ln(fill_red(i,1));
    
end
for i=1:length(fill_yellow)
    x_yellow(i)=eps(fill_yellow(i,2));
    y_yellow(i)=Ln(fill_yellow(i,1));
end 
YELLOW=[x_yellow; y_yellow]'
RED=[x_red; y_red]'
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
f_obj1 = f_obj1(1:99, 1:99);
figure();
contour(eps(1:99),Ln(1:99),f_obj1,100);
xlabel('Expansion Ratio x_1')
ylabel('Nozzle Length x_2')
hold on
% Plot a single yellow dot for the legend
plot(YELLOW(1,1), YELLOW(1,2), 'o', 'MarkerFaceColor', 'y', 'MarkerEdgeColor', 'none');

% Plot a single red dot for the legend
plot(RED(1,1), RED(1,2), 'o', 'MarkerFaceColor', 'r', 'MarkerEdgeColor', 'none');

% Fill points specified by YELLOW matrix with yellow color
for k = 1:size(YELLOW, 1)
    x = YELLOW(k, 1);
    y = YELLOW(k, 2);
    plot(x, y, 'o', 'MarkerFaceColor', 'y', 'MarkerEdgeColor', 'none');
end

% Fill points specified by RED matrix with red color
for k = 1:size(RED, 1)
    x = RED(k, 1);
    y = RED(k, 2);
    plot(x, y, 'o', 'MarkerFaceColor', 'r', 'MarkerEdgeColor', 'none');
end
legend('f obj', 'Ratio< 0.01', 'Ratio>100', 'Location', 'best');
