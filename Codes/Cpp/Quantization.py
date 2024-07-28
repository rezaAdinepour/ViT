import numpy as np
import torch



def activation_quant(x):
    scale = 127.0 / x.abs().max(dim=-1, keepdim=True).values.clamp_(min=1e-5)
    return (x * scale).round().clamp_(-128, 127) / scale

def weight_quant(w):
    scale = 1.0 / w.abs().mean().clamp_(min=1e-5)
    return (w * scale).round().clamp_(-1, 1) / scale





torch.manual_seed(42)

a = torch.rand(5, 5)
a = a * 10 + 10
print(a)
print()

a_act_quant = activation_quant(a)
print(a_act_quant)
print()

a_weigth_quant = weight_quant(a)
print(a_weigth_quant)
print()