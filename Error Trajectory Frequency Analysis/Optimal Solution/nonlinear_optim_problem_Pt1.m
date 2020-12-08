 %%%Non-Linear Optimization Problem w/ RKHS Part 1
%Provides Error Expert01_Trajectory from Raw Data - Optimal Expert01_Trajectory
%
clc

% Constants
N = size(Expert01_Trajectory, 1);
%Ts = 0.034;
Ts = 0.415;
V = 5;

% Optimization Variables
x = optimvar('x', N);
y = optimvar('y', N);
u = optimvar('u', N);


%%
x0.x(1) = 25;
x0.y(1) = 400;

x0.u = deg2rad(Expert01_Trajectory(:, 8).');

for k = 2:N
    x0.x(k) = x0.x(k-1) + Ts*(V*cos(x0.u(k-1)));
    x0.y(k) = x0.y(k-1) + Ts*(V*sin(x0.u(k-1)));
end

% x0.y = -x0.y;

%%

% Objective Function
obj = objfun(u);

prob = optimproblem('Objective', obj);

% Dynamic Constraints
% prob.Constraints.DynamicConstraintX = fcn2optimexpr(@(z) diff(z), x) == fcn2optimexpr(@(z) V*cos(z), u(1:end-1));
% prob.Constraints.DynamicConstraintY = fcn2optimexpr(@(z) diff(z), y) == fcn2optimexpr(@(z) V*sin(z), u(1:end-1));
% prob.Constraints.DynamicConstraintU = fcn2optimexpr(@(z) diff(z), u) == u(1:end-1);

% Ts = 0.034;
prob.Constraints.DynamicConstraintX = x(2:end) == x(1:end-1) + Ts*(fcn2optimexpr(@(z) V*cos(z), u(1:end-1)));
prob.Constraints.DynamicConstraintY = y(2:end) == y(1:end-1) + Ts*(fcn2optimexpr(@(z) V*sin(z), u(1:end-1)));
prob.Constraints.DynamicConstraintU = u(2:end) == u(1:end-1) + Ts*(u(1:end-1));

% prob.Constraints.DynamicConstraintX = x(2:end) == x(1:end-1) + Ts*(V*cos(u(1:end-1)));
% prob.Constraints.DynamicConstraintY = y(2:end) == y(1:end-1) + Ts*(V*sin(u(1:end-1)));

% Problem Constraints

% Pengiun = 41 x 41 pixels
% Obstacle1 = (250, 400)
% Obstacle2 = (500, 390)
% Obstacle3 = (760, 410)

% prob.Constraints.Obstacle1Constraint = fcn2optimexpr(@(zx, zy) inpolygon(zx, zy, ...
%     [230 250 250 230], ...
%     [420 420 0   0]), x, y) == 0;

% prob.Constraints.Obstacle1Constraint1 = x <= 250 - 20;
% prob.Constraints.Obstacle1Constraint2 = x >= 250 + 20;
% prob.Constraints.Obstacle1Constraint3 = y <= 400 - 20;
% prob.Constraints.Obstacle1Constraint4 = y >= 400 + 20;
% 
% prob.Constraints.Obstacle2Constraint1 = x <= 500 - 20;
% prob.Constraints.Obstacle2Constraint2 = x >= 500 + 20;
% prob.Constraints.Obstacle2Constraint3 = y <= 390 - 20;
% prob.Constraints.Obstacle2Constraint4 = y >= 390 + 20;
% 
% prob.Constraints.Obstacle3Constraint1 = x <= 760 - 20;
% prob.Constraints.Obstacle3Constraint2 = x >= 760 + 20;
% prob.Constraints.Obstacle3Constraint3 = y <= 410 - 20;
% prob.Constraints.Obstacle3Constraint4 = y >= 410 + 20;

% Start = (25, 400)
% End = (999, 384)

prob.Constraints.InitialConditionX = x(1) == 25;
prob.Constraints.InitialConditionY = y(1) == 400;

prob.Constraints.Obstacle1Constraint = fcn2optimexpr(@(zx, zy) ...
    p_poly_dist(zx, zy, [230 250 250 230], [420 420 0 0]), ...
    x, y, 'OutputSize', [N, 1]) >= 20;
prob.Constraints.Obstacle2Constraint = fcn2optimexpr(@(zx, zy) ...
    p_poly_dist(zx, zy, [480 500 500 480], [370 370 1000 1000]), ...
    x, y, 'OutputSize', [N, 1]) >= 20;
prob.Constraints.Obstacle3Constraint = fcn2optimexpr(@(zx, zy) ...
    p_poly_dist(zx, zy, [740 760 760 740], [430 430 0 0]), ...
    x, y, 'OutputSize', [N, 1]) >= 20;
prob.Constraints.TerminalConstraint = fcn2optimexpr (@(zx, zy) ...
    p_poly_dist(zx, zy, [979 979 999 999], [404 364 364 404]), ...
    x(end), y(end), 'OutputSize', [1, 1]) <= 0;

% prob.Constraints.Obstacle1Constraint = fcn2optimexpr(@(zx, zy) inpolygon(zx, zy, ...
%     [230 250 250 230],[420 420 0 0]), x, y) == 0;
% 
% prob.Constraints.Obstacle2Constraint = fcn2optimexpr (@(zx, zy) inpolygon(zx, zy, ... 
%     [480 500 500 480],[370 370 1000 1000]), x, y) == 0;
% 
% prob.Constraints.Obstacle3Constraint = fcn2optimexpr (@(zx, zy) inpolygon(zx, zy, ...
%     [740 760 760 740],[430 430 0 0]), x, y) == 0;
% 
% prob.Constraints.TerminalConstraint = fcn2optimexpr (@(zx, zy) inpolygon(zx, zy, ...
%     [979 979 999 999], [404 364 364 404]), x(end), y(end)) == 1;

%%

% options = optimoptions(prob, 'MaxFunctionEvaluations', 1E5);
options = optimoptions(prob, 'MaxFunctionEvaluations', 1E4);

[sol, ~] = solve(prob, x0, 'Options', options);

function f = objfun(u)
    f = u.'*u;
end

function [xp, yp] = dynamics(x, y, u)
    xp = x + 0.034*(5*cos(u));
    yp = y + 0.034*(5*sin(u));
end

