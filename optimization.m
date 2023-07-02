clear vriables
clc
openfig("figure.fig");
hold on
load DATA.mat

%% optimization
clc
% Define the objective function
objective = @(x) Objective_function(x,max(Thrust,[],"all"),max(Mass,[],"all"));

% Define the initial guess
x0 = [20, 0.12];

% Define the nonlinear constraint function
nonlcon = @(x) simp_constraints(x);

% Define the optimization options
options = optimoptions(@fmincon, 'Display', 'iter','Algorithm','interior-point', 'FiniteDifferenceStepSize',0.001,'TolX', 1e-10, 'TolCon', 1e-3);
tic;
% Run the optimization
[x_opt, f_opt, exitflag, output,lambda,grad] = fmincon(objective, x0, [], [], [], [], [eps(1) Ln(1)], [eps(end) Ln(end)], nonlcon, options);
toc;

% options = optimoptions(@ga,'Display', 'iter');
% tic
% % Run the ga optimization
% [x_opt, f_opt, exitflag, output,lambda,grad] = ga(objective, 2, [], [], [], [], [eps(1) Ln(1)], [eps(end) Ln(end)], nonlcon, options);
% toc
scatter(x_opt(1),x_opt(2),'*r')

% Add a new element to the legend
new_entry = 'x opt';

% Get the handle of the current legend
hLegend = legend;
% Remove the old legend
delete(hLegend);
% Create a new legend with the desired elements
legend('f obj','g2','','g3','','g4','','g6','','x opt', 'Location', 'best');



% Display function to show the value of x after each iteration
function stop = displayFunc(x, optimValues, state)
    fprintf('Iteration: %d\n', optimValues.iteration);
    fprintf('x = [%f, %f]\n', x(1), x(2));
    scatter(x(1),x(2))
    hold on
    stop = false;
end

