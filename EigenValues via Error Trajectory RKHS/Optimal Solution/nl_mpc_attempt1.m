load('[Expert01]State_Trajectory_MATLAB.mat')

nx = 2;
ny = 2;
nu = 1;

nlobj = nlmpc(nx, ny, nu);

nlobj.Model.StateFcn = @penguin_state_function;
nlobj.Jacobian.StateFcn = @penguin_state_jacobian;

Ts = 0.034;
p = size(trajectory, 1);

nlobj.Ts = Ts;
nlobj.PredictionHorizon = p;

nlobj.ControlHorizon = p;

nlobj.Optimization.CustomCostFcn = @(X, U, e, data) Ts*sum(sum(U(1:p, :)));
nlobj.Optimization.ReplaceStandardCost = true;

nlobj.Optimization.CustomIneqConFcn = @penguin_inequality_constraints;

for ct = 1:nu
    nlobj.MV(ct).Min = 0;
    nlobj.MV(ct).Max = pi;
end

x0 = [25;400];
u0 = 0;

%%
[~, ~, info] = nlmpcmove(nlobj, x0, u0);