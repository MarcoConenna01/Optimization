%% 
figure()

contour(eps,Ln,f_obj1,70); 
ylabel('Ln (x_2)[m]')
xlabel('Expansion ratio (x_1)')
hold on 
contour(eps,Ln,g6,[0 0],'k',LineWidth=2); %mass 
hold on
contour(eps,Ln,g6,[0.05 0.05],'--k',LineWidth=2);
legend('f obj','g6 constraint')
grid on
colorbar
cb = colorbar;
title(cb, 'f obj');
%ylabel(cb, 'f obj', 'Position', [1.05, 0.5], 'HorizontalAlignment', 'left');

%% Ln
figure();
for i=1:length(Ln)
plot(Ln,g6(i,:));
hold on
end
xlabel('Nozzle Length (x_2)')
ylabel('g6')
title('Behavior of g6 with respect to x_2, considering all x_1 in the domain')
grid on

% Add arrow annotation for increasing Ln values
x_start = 0.3;  % x-coordinate of the starting point of the arrow
y_start = 0.13;  % y-coordinate of the starting point of the arrow
x_end = 0.4;% x-coordinate of the ending point of the arrow
y_end = 0.4;  % y-coordinate of the ending point of the arrow

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
legend_text = 'Increasing x_1';
text(0.2, 0.95, legend_text, 'HorizontalAlignment', 'center', 'VerticalAlignment', 'middle', 'FontSize', 10, 'FontWeight', 'bold');

% Adjust the legend box properties
legend_title = 'Legend';
legend(legend_axes, 'off');  % Turn off the default legend
legend_axes.Title.String = legend_title;
legend_axes.Title.FontWeight = 'bold';

% Adjust the legend box position and size as desired
legend_axes.Position = [0.3, 0.27, 0.1, 0.1];


%% eps
figure();
for i=1:length(eps)
plot(eps,g4(:,i));
hold on
pause
end
xlabel('Expansion ratio (x_1)')
ylabel('g_4')
title('Behavior of g4 with respect to x_1, considering all x_2 in the domain')
grid on

% Add arrow annotation for increasing Ln values
x_start = 0.3;  % x-coordinate of the starting point of the arrow
y_start = 0.15;  % y-coordinate of the starting point of the arrow
x_end = 0.4;% x-coordinate of the ending point of the arrow
y_end = 0.72;  % y-coordinate of the ending point of the arrow

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
text(0.2, 0.95, legend_text, 'HorizontalAlignment', 'center', 'VerticalAlignment', 'middle', 'FontSize', 10, 'FontWeight', 'bold');

% Adjust the legend box properties
legend_title = 'Legend';
legend(legend_axes, 'off');  % Turn off the default legend
legend_axes.Title.String = legend_title;
legend_axes.Title.FontWeight = 'bold';

% Adjust the legend box position and size as desired
legend_axes.Position = [0.4, 0.57, 0.1, 0.1];


%%
figure();
for i=1:length(Ln)
plot(eps,f_obj1(:,i));
hold on
end
xlabel('Nozzle length [m] (x_2)')
ylabel('f obj')
title('Behavior of f obj with respect to x_2, considering all x_1 in the domain')
grid on

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
legend_text = 'Increasing x_1';
text(0.1, 0.99, legend_text, 'HorizontalAlignment', 'center', 'VerticalAlignment', 'middle', 'FontSize', 10, 'FontWeight', 'bold');

% Adjust the legend box properties
legend_title = 'Legend';
legend(legend_axes, 'off');  % Turn off the default legend
legend_axes.Title.String = legend_title;
legend_axes.Title.FontWeight = 'bold';

% Adjust the legend box position and size as desired
legend_axes.Position = [0.8, 0.8, 0.1, 0.1];


%% contour Plots
figure()
contour(eps,Ln,f_obj1,50)
ylabel('Ln [m] (x_2)')
xlabel('Expansion ratio (x_1)')
hold on
contour(eps,Ln,g2,[0 0],'r',LineWidth=1.5); %thickness min
hold on
contour(eps,Ln,g2,[0.07 0.07],'--r',LineWidth=1.5);
hold on
contour(eps,Ln,g3,[0 0],'b',LineWidth=1.5); %alpha min
hold on
contour(eps,Ln,g3,[0.07 0.07],'--b',LineWidth=1.5);
hold on
contour(eps,Ln,g4,[0 0],'k',LineWidth=1.5); %alpha max
hold on
contour(eps,Ln,g4,[0.07 0.07],'--k',LineWidth=1.5);
hold on
contour(eps,Ln,g6,[0 0],'g',LineWidth=1.5); %mass 
hold on
contour(eps,Ln,g6,[0.07 0.07],'--g',LineWidth=1.5);
% Extract the boundaries
boundary1 = g2
boundary2 = g3
boundary3 = g4
boundary4 = g6
% Create a logical mask for the zone to fill
zone_mask = boundary1 < 0 & boundary2 < 0 & boundary3 < 0 & boundary4 < 0;

% % Fill the zone
% fill(eps(boundary1), Ln(boundary1), 'y', 'FaceAlpha', 0.3);
% fill(eps(boundary2), Ln(boundary2), 'y', 'FaceAlpha', 0.3);
% fill(eps(boundary3), Ln(boundary3), 'y', 'FaceAlpha', 0.3);
% fill(eps(boundary4), Ln(boundary4), 'y', 'FaceAlpha', 0.3);
% % Create a mask for the valid zone
% Fill the zone
[X Y]= meshgrid(eps,Ln)
scatter(X(zone_mask), Y(zone_mask),'Marker', '.', 'MarkerEdgeColor', 'y');
grid on
colorbar
cb = colorbar;
title(cb, 'f obj');

% Add legend
legend('f obj', 'g2', '', 'g3', '', 'g4', '', 'g6', '', 'Location', 'best');

% Set legend markers
legend_markers = findobj(gcf, 'Type', 'Line');
set(legend_markers(3:2:end), 'Marker', 'o', 'MarkerFaceColor', 'w', 'MarkerSize', 0.1);

% Remove line objects from legend
legend_lines = findobj(legend_markers, 'Type', 'Line');
delete(legend_lines);

%% surf

figure();
surf(eps,Ln,f_obj1);
xlabel('Expansion ratio (x_1)');
ylabel('Nozzle length Ln (x_2)');
title('Objective function');
grid on
colorbar
cb = colorbar;
title(cb, 'f obj')