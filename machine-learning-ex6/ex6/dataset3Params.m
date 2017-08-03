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
sigma = 0.1;

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

%{
all_C = [0.01, 0.03, 0.1, 0.3, 1, 3, 10, 30];
all_sigma = [0.01, 0.03, 0.1, 0.3, 1, 3, 10, 30];
min_error = 0;

for i = 1:length(all_C)

	for j = 1:length(all_sigma)

		model= svmTrain(X, y, all_C(i), @(x1, x2) gaussianKernel(x1, x2, all_sigma(j)));
		predictions = svmPredict(model, Xval);
		curr_error = mean(double(predictions ~= yval));
		disp(curr_error);
		if curr_error < min_error || min_error == 0
			min_error = curr_error;
			C = all_C(i);
			sigma = all_sigma(j);
		endif

	end

end

%}

% =========================================================================

end
