clear variables
clc
load DATA.mat

% Define the objective function
objective = @(x) Objective_function2(x, max(Thrust,[],"all"), max(Mass,[],"all"));

% Define the initial guess
x0 = [40, 0.8, 0.5];

% Define the nonlinear constraint function
nonlcon = @(x) constraints2(x);

% Define the optimization options
options = optimoptions(@fmincon, 'Display', 'none', 'Algorithm', 'sqp', 'FiniteDifferenceStepSize', 0.01, 'StepTolerance', 1e-12, 'MaxFunctionEvaluations', 100000, 'OutputFcn', @outputFunc);
tic
% Run the optimization
[x_opt, f_opt, exitflag, output, lambda, grad] = fmincon(objective, x0, [], [], [], [], [eps(1) Ln(1) D_t(1)], [eps(end) Ln(end) D_t(end)], nonlcon, options);
toc

figure();

% Output function to print x after each iteration
function stop = outputFunc(x,optimValues,state)
    stop = false;
    if isequal(state,'iter')
        disp(['Current x: ' num2str(x)]);
    end
end