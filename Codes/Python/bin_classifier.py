import numpy as np

def predict(inputs, weights):
    summation = np.dot(inputs, weights[1:]) + weights[0]
    activation = 1.0 if (summation > 0.0) else 0.0
    return activation

x = np.array([[0, 0],
              [1, 0],
              [0, 1],
              [1, 1]])

y = np.array([0, 0, 0, 1])

print("inputs: ", x)
print('-' * 50)

num_of_inputs = 2
epochs = 20
learning_rate = 0.1
w = np.array([0.5, -0.6, 0.2])

print("weights: ", w)
print('-' * 50)

for epoch in range(epochs):
    fail_count = 0

    for inputs, label in zip(x, y):
        prediction = predict(inputs, w)

        if label != prediction:
            w[1:] += learning_rate * (label - prediction) * inputs.reshape(inputs.shape[0])
            w[0] += learning_rate * (label - prediction)
            fail_count += 1
    if fail_count == 0:
        break

print("weights after training: ", w)
print('-' * 50)


for inputs, label in zip(x, y):
    prediction = predict(inputs, w)
    print(f"Input: {inputs}, True Label: {label}, Predicted Label: {prediction}")