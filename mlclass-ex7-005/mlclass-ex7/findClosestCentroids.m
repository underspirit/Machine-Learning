function idx = findClosestCentroids(X, centroids)
%FINDCLOSESTCENTROIDS computes the centroid memberships for every example
%   idx = FINDCLOSESTCENTROIDS (X, centroids) returns the closest centroids
%   in idx for a dataset X where each row is a single example. idx = m x 1 
%   vector of centroid assignments (i.e. each entry in range [1..K])
%

% Set K
K = size(centroids, 1);

% You need to return the following variables correctly.
idx = zeros(size(X,1), 1);

% ====================== YOUR CODE HERE ======================
% Instructions: Go over every example, find its closest centroid, and store
%               the index inside idx at the appropriate location.
%               Concretely, idx(i) should contain the index of the centroid
%               closest to example i. Hence, it should be a value in the 
%               range 1..K
%
% Note: You can use a for-loop over the examples to compute this.
%
distance = zeros(K, 1);
for i = 1 : size(X, 1)
    distance = sum((bsxfun(@minus, X(i, :), centroids)).^2, 2);
    %或者使用pdist2
    %distanse = pdist2(centroids,X(i,:));
    [p idx(i)] = min(distance);
    
    %或者进一步使用pdist2,只需一行代码
    % [C, idx(i)]=pdist2(centroids,X(i,:),'euclidean','Smallest',1);
end

% =============================================================

end

