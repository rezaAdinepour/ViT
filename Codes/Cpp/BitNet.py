import torch
import torch.nn.functional as F
from torch import nn


def activation_quant(x):
    scale = 127.0 / x.abs().max(dim=-1, keepdim=True).values.clamp_(min=1e-5)
    return (x * scale).round().clamp_(-128, 127) / scale


def weight_quant(w):
    scale = 1.0 / w.abs().mean().clamp_(min=1e-5)
    return (w * scale).round().clamp_(-1, 1) / scale


class BitLinear(nn.Linear):
    def __init__(self, in_features: int, out_features: int, bias: bool = False,
                 device=None, dtype=None):
        super().__init__(in_features, out_features, bias, device, dtype)

    def forward(self, x):
        x_quant = x + (activation_quant(x) - x).detach()
        w_quant = self.weight + (weight_quant(self.weight) - self.weight).detach()
        
        print("Quantized Input: ")
        print(x_quant)
        print()

        print("Initial Weights: ")
        print(self.weight)
        print()
        
        print("Quantized Weights: ")
        print(w_quant)
        print()

        print("Initial bias: ")
        print(self.bias)
        print()

        return F.linear(x_quant, w_quant, self.bias)



torch.manual_seed(0)


in_features = 4
out_features = 2
bit_linear = BitLinear(in_features, out_features, bias=False)


with torch.no_grad():
    bit_linear.weight = nn.Parameter(torch.tensor([ [0.2, 0.8, -0.3, 0.1],
                                                    [0.5, -0.1, 0.4, -0.5] ]))


input_tensor = torch.tensor([ [1.0, -1.0, 2.0, -2.0],
                              [0.5, -0.5, 1.0, -1.0] ])

print("Input: ")
print(input_tensor)
print()


output_tensor = bit_linear(input_tensor)



print("Output: ")
print(output_tensor)
