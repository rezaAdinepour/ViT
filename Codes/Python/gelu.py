import torch
from torch import nn
import math



class GELUActivation(nn.Module):

    def forward(self, input):
        return (0.5 * input * (1.0 + torch.tanh(math.sqrt(2.0 / math.pi) * (input + 0.044715 * torch.pow(input, 3.0)))))