function cineq = penguin_inequality_constraints(X, U, e, data)

% Terminal Constraint
%  cineq(1) = p_poly_dist(X(end, 1), X(end, 2), [979 979 999 999], [404 364 364 404]);
% cineq(1) = X(end, 1) <= 404;
% cineq(2) = X(end, 1) >= 364;
% cineq(3) = X(end, 2) <= 999;
% cineq(4) = X(end, 2) >= 979;

p = data.PredictionHorizon;
X1 = X(2:p+1,1);
X2 = X(2:p+1,2);

cineq = [
    X1(end) - 404;
    364 - X1(end);
    X2(end) - 999;
    979 - X2(end);
    20 - p_poly_dist(X1, X2, [230 250 250 230], [420 420 0 0]);
    20 - p_poly_dist(X1, X2, [480 500 500 480], [370 370 1000 1000]);
    20 - p_poly_dist(X1, X2, [740 760 760 740], [430 430 0 0]);
    ];
