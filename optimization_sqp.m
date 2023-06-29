clear vriables
clc
openfig("Simplified.fig")
hold on
load DATA.mat

%% optimization
clc
% Define the objective function
objective = @(x) Objective_function(x,max(Thrust,[],"all"),max(Mass,[],"all"));

% Define the initial guess
x0 = [45, 0.5];

% Define the nonlinear constraint function
nonlcon = @(x) simp_constraints(x);

% Define the optimization options
options = optimoptions('fmincon', 'Display', 'iter-detailed', 'Algorithm', 'sqp', 'TolX', 1e-18);

% Run the optimization
[x_opt, f_opt, exitflag, output] = fmincon( objective, x0, [], [], [], [], [], [],nonlcon, options);
scatter(x_opt(1),x_opt(2))
% Display function to show the value of x after each iteration
function stop = displayFunc(x, optimValues, state)
    fprintf('Iteration: %d\n', optimValues.iteration);
    fprintf('x = [%f, %f]\n', x(1), x(2));
    scatter(x(1),x(2))
    hold on
    stop = false;
end