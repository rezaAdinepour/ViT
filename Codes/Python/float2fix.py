import torch
from fxpmath import Fxp
from PIL import Image
import torchvision.transforms as transforms
import numpy as np



img = Image.open("Data/lena.png")
img = img.resize((256, 256))


transform = transforms.ToTensor()
img_tensor = transform(img)
img_tensor = (img_tensor * 255).to(torch.uint8)


img_fix = Fxp(img_tensor.numpy(), signed=False, n_word=8, n_frac=1)

np.save("img_fix.npy", img_fix.get_val())
print("saving is Done!")