import numpy as np
from PIL import Image
import matplotlib.pyplot as plt
import os
from math import ceil, sqrt

import sys

def unpack_npz(npz_file, output_dir):
    # Create the output directory if it doesn't exist
    os.makedirs(output_dir, exist_ok=True)
    
    # Load the npz file
    data = np.load(npz_file)
    
    # Extract the images from the npz file
    images = data['arr_0']
    
    # Iterate over each image and save it to a file
    for i, image_array in enumerate(images):
        filename = os.path.join(output_dir, f'image_{i}.png')  # Change the extension if images are not JPEG

        image = Image.fromarray(image_array)

        image.save(filename)
        
def display_images(npz_file):

    data = np.load(npz_file)
    images = data['arr_0']

    num_images = len(images)
    
    # Create a figure with 4x4 grid
    fig, axes = plt.subplots(nrows=4, ncols=4, figsize=(10, 10))
    
    # Adjust the layout
    plt.tight_layout()

    # Calculate the dimensions of the grid
    grid_size = ceil(sqrt(num_images))
    
    # Create a figure with subplots in a grid
    fig, axes = plt.subplots(grid_size, grid_size, figsize=(10, 10))
    
    # Flatten axes array for easy indexing
    axes = axes.flatten()
    
    # Iterate over each image and plot it
    for i, image_array in enumerate(images):
        axes[i].imshow(image_array)
        axes[i].axis('off')  # Hide axes for a cleaner look
    
    plt.tight_layout()
    plt.show()

if __name__ == "__main__":

    if len(sys.argv) < 2:
        print("ERROR: not enough args")
        print("USAGE:")
        print("python3 unpack_samples.py <path-to-npz> [--display]")
        exit(0)

    # Replace 'images.npz' with the path to your npz files
    npz_file = sys.argv[1]

    unpack_npz(npz_file, "samples")

    if len(sys.argv) > 2 and sys.argv[2] == "--display":
        #unpack_npz(npz_file, output_dir)
        display_images(npz_file)


