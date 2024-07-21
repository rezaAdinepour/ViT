import torch
from torch import nn
import numpy as np
from gelu import GELUActivation




class MLP(nn.Module):
    """
    A multi-layer perceptron module.
    """

    def __init__(self, config):
        super().__init__()
        self.dense_1 = nn.Linear(config["hidden_size"], config["intermediate_size"], dtype=torch.float32)
        self.activation = GELUActivation()
        self.dense_2 = nn.Linear(config["intermediate_size"], config["hidden_size"], dtype=torch.float32)
        self.dropout = nn.Dropout(config["hidden_dropout_prob"])

    def forward(self, x):
        x = self.dense_1(x)
        x = self.activation(x)
        x = self.dense_2(x)
        x = self.dropout(x)
        return x
    



img = np.load("img_fix.npy")
print(img.shape)

img_tensor = torch.from_numpy(img).to(torch.float32)
print(img_tensor.size())


config = {
    "hidden_size": 256,
    "intermediate_size": 512,
    "hidden_dropout_prob": 0.1,
}

mlp = MLP(config)

output = mlp(img_tensor)

print("Output Shape:", output.shape)