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
x0 = [20, 0.9];

% Define the nonlinear constraint function
nonlcon = @(x) simp_constraints(x);

% Define the optimization options
options = optimoptions('fmincon', 'Display', 'off', 'Algorithm', 'sqp', 'TolX', 1e-8, 'TolCon', 1e-8, 'OutputFcn', @displayFunc);

% Run the optimization
[x_opt, f_opt, exitflag, output] = fmincon(objective, x0, [], [], [], [], [], [],nonlcon, options);

% Display function to show the value of x after each iteration
function stop = displayFunc(x, optimValues, state)
    fprintf('Iteration: %d\n', optimValues.iteration);
    fprintf('x = [%f, %f]\n', x(1), x(2));
    scatter(x(2),x(1))
    hold on
    stop = false;
end