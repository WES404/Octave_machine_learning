function [C, sigma] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.3;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%
c_list = [0.01, 0.03, 0.1, 0.3, 1, 3, 10, 30];
sigma_list = [0.01, 0.03, 0.1, 0.3, 1, 3, 10, 30];

row = 0;
for i = 1:size(c_list, 2) %intera nas listas encontrando o melhor valor de c e sigma
    c_temp = c_list(i);

    for j = 1:size(sigma_list, 2)
        row += 1;
        sigma_temp = sigma_list(j);
        model = svmTrain(X, y, c_temp, @(x1, x2) gaussianKernel(x1, x2, sigma_temp));

        pred = svmPredict(model, Xval);
        dif = mean(double(pred ~= yval));

        %add valores na lista melhor
        valores(row, :) = [dif, c_temp, sigma_temp];
    endfor
endfor

%% Encontra o melhor valor

menor = min(valores(:, 1));
ind = find(menor==valores(:,1));

C = valores(ind,2);
sigma = valores(ind,3);

% =========================================================================

end
