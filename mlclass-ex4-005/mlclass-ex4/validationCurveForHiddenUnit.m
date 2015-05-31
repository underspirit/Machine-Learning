function [hidden_layer_vec, error_train, error_val] = ...
    validationCurveForHiddenUnit(input_layer_size, ...
                                  lambda , ...
                                   num_labels, X, y, Xval, yval)

% Selected values of lambda (you should not change this)
hidden_layer_vec = [2 : 50]';

% You need to return these variables correctly.
error_train = zeros(length(hidden_layer_vec), 1);
error_val = zeros(length(hidden_layer_vec), 1);

% ====================== YOUR CODE HERE ======================
for i = 1:length(hidden_layer_vec)
    hidden_layer_size = hidden_layer_vec(i);
    nn_params = trainNN(input_layer_size, ...
                                   hidden_layer_size, ...
                                   num_labels, X, y, lambda);
    error_train(i) = nnCostFunction(nn_params, ...
                                   input_layer_size, ...
                                   hidden_layer_size, ...
                                   num_labels, X, y, 0);
    error_val(i) = nnCostFunction(nn_params, ...
                                   input_layer_size, ...
                                   hidden_layer_size, ...
                                   num_labels, Xval, yval, 0);
end








% =========================================================================

end
