function J = computeCost(X, y, theta)
%COMPUTECOST Compute cost for linear regression
%   J = COMPUTECOST(X, y, theta) computes the cost of using theta as the
%   parameter for linear regression to fit the data points in X and y

% Initialize some useful values
m = length(y); % number of training examples


% You need to return the following variables correctly
J = 0;

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta
%               You should set J to the cost.
H_0 = theta(1) + theta(2) * X; %Tira o erro
H_error = (H_0 - y);
H_sqr = H_error.^2;
soma = sum(H_sqr); %soma o erro ao quadrado
J = (1 / (2 * m)) * soma;



% =========================================================================

end
