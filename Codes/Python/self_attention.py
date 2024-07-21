import torch
from torch import nn
import numpy as np
import math



class AttentionHead(nn.Module):
    """
    A single attention head.
    This module is used in the MultiHeadAttention module.
    """
    def __init__(self, hidden_size, attention_head_size, dropout, bias=True):
        super().__init__()
        self.hidden_size = hidden_size
        self.attention_head_size = attention_head_size
        # Create the query, key, and value projection layers
        self.query = nn.Linear(hidden_size, attention_head_size, bias=bias, dtype=torch.float32)
        self.key = nn.Linear(hidden_size, attention_head_size, bias=bias, dtype=torch.float32)
        self.value = nn.Linear(hidden_size, attention_head_size, bias=bias, dtype=torch.float32)

        self.dropout = nn.Dropout(dropout)
    
    def forward(self, x):
        # Project the input into query, key, and value
        # The same input is used to generate the query, key, and value,
        # (batch_size, sequence_length, hidden_size) -> (batch_size, sequence_length, attention_head_size)
        query = self.query(x)
        key = self.key(x)
        value = self.value(x)
        # Calculate the attention scores
        # softmax(Q*K.T/sqrt(head_size))*V
        attention_scores = torch.matmul(query, key.transpose(-1, -2))
        attention_scores = attention_scores / math.sqrt(self.attention_head_size)
        attention_probs = nn.functional.softmax(attention_scores, dim=-1)
        attention_probs = self.dropout(attention_probs)
        # Calculate the attention output
        attention_output = torch.matmul(attention_probs, value)
        return (attention_output, attention_probs)








img = np.load("img_fix.npy")
print(img.shape)

img_tensor = torch.from_numpy(img).to(torch.float32)
print(img_tensor.size())


img_tensor = img_tensor.unsqueeze(0)
img_tensor_reshaped = img_tensor.view(1, 256, 3 * 256)

# img_tensor = torch.randn(1, 3, 256, 256) 
# img_tensor_reshaped = img_tensor.view(1, 256, 3 * 256)

hidden_size = 3 * 256
attention_head_size = 64
dropout = 0.1
attention_head = AttentionHead(hidden_size, attention_head_size, dropout)

# Forward pass
attention_output, attention_probs = attention_head(img_tensor_reshaped)

print("Attention Output Shape:", attention_output.shape)
print("Attention Probs Shape:", attention_probs.shape)
print(attention_output)
print(attention_probs)