using DecisionTree
using RDatasets

iris = dataset("datasets", "iris")
features = convert(Array, iris[:, 1:4])
lables = convert(Array, iris[:, 5])

model = build_tree(lables, features)
model = prune_tree(model, 0.9)

# print_tree(model, 5)

apply_tree(model, [5.9, 3.0, 5.1, 1.9])
apply_tree(model, [1.9, 2.0, 2.1, 1.9])

# nfold cross validation for pruned tree
n_folds = 3
accuracy = nfoldCV_tree(lables, features, n_folds, 0.9)

# adaptive boosting
model, coeffs = build_adaboost_stumps(lables, features, 10)

apply_adaboost_stumps(model, coeffs, [5.9, 3.0, 5.1, 1.9])

# adaboost nfold cross-validation
accuracy = nfoldCV_stumps(lables, features, 3, 8)

# forests
model = build_forest(lables, features, 2, 10, 0.5)

apply_forest(model, [5.9, 3.0, 5.1, 1.9])

# forests nfold cross-validation
accuracy = nfoldCV_forest(lables, features, 3, 2)
