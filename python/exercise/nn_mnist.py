import numpy as np
from scipy.special import expit
# from matplotlib import pyplot as plt


class NueralNetwork:
    def __init__(self, input_nodes, hidden_nodes, output_nodes, learning_rate):
        self.i_nodes = input_nodes
        self.h_nodes = hidden_nodes
        self.o_nodes = output_nodes
        self.lr = learning_rate
        self.wih = np.random.normal(0, pow(self.h_nodes, -0.5), (self.h_nodes, self.i_nodes))
        self.who = np.random.normal(0, pow(self.o_nodes, -0.5), (self.o_nodes, self.h_nodes))

        self.activation_func = lambda x: expit(x)

    def query(self, inputs):
        inputs = np.array(inputs, ndmin=2).T

        h_inputs = np.dot(self.wih, inputs)
        h_outputs = self.activation_func(h_inputs)

        o_inputs = np.dot(self.who, h_outputs)
        o_outputs = self.activation_func(o_inputs)

        return o_outputs

    def train(self, inputs, targets):
        inputs = np.array(inputs, ndmin=2).T
        targets = np.array(targets, ndmin=2).T

        h_inputs = np.dot(self.wih, inputs)
        h_outputs = self.activation_func(h_inputs)

        o_inputs = np.dot(self.who, h_outputs)
        o_outputs = self.activation_func(o_inputs)

        o_errors = targets - o_outputs
        h_erros = np.dot(self.who.T, o_errors)
        self.who += self.lr * np.dot((o_errors * o_outputs * (1 - o_outputs)), np.transpose(h_outputs))
        self.wih += self.lr * np.dot((h_erros * h_outputs * (1 - h_outputs)), np.transpose(inputs))


# n = NueralNetwork(3, 3, 3, 0.3)
# print(n.query([0.4, -1.4, 1.1]))

output_nodes = 10
n = NueralNetwork(784, 100, output_nodes, 0.3)

with open('mnist_train_100.csv') as fh:
    data = fh.readlines()

for record in data:
    item = record.split(',')
    label = item[0]
    inputs = (np.asfarray(item[1:]) / 255.0 * 0.99) + 0.01
    targets = np.zeros(output_nodes) + 0.01
    targets[int(label)] = 0.99
    n.train(inputs, targets)
    # print(n.wih, n.who)

# img_array = np.asfarray(item1[1:]).reshape(28, 28)
# plt.imshow(img_array, cmap='Grays', interpolation='None')
