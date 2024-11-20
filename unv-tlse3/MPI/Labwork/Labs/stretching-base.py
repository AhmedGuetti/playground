# python3 stretching-base.py
import numpy as np
import matplotlib.image as mpimg
import matplotlib.pyplot as plt 
import matplotlib.cm as cm

M = 255

# First method for stretching contrast
def f_one(x,n):
        if x==0:
                return 0
        return int(M**(1-n) * (x**n))

# Second method for stretching contrast
def f_two(x,n):
        if x==0:
                return 0
        return int((M**((n-1)/n)) * (x**(1/n)))

# Converts an image to grayscale
def rgb2gray(rgb):
        return np.dot(rgb[...,:3], [0.299, 0.587, 0.114])

# Loads an image on disk named "image.png" and convert it to greyscale, and shows it
def readImage():
        img = mpimg.imread('./image.png')
        plt.imshow(img)
        print("Press 'q' to continue")
        plt.show()
        grey = rgb2gray(img)
        pixels, nblines, nbcolumns = (np.ravel(grey)*255).astype(np.int32), len(grey), len(grey[0])
        return pixels, nblines, nbcolumns

# Saves the image in "image-grey2-stretched.png" and shows it
def saveImage(newP, nblines, nbcolumns):
        newimg = newP.reshape((nblines, nbcolumns))
        plt.imshow(newimg, cmap = cm.Greys_r)
        print("Press 'q' to continue")
        plt.show()
        mpimg.imsave('image-grey2-stretched.png', newimg, cmap = cm.Greys_r )

print("Starting stretching...")

# load the image
pixels, nblines, nbcolumns = readImage()

# compute min and max of pixels
pix_min = min(pixels)
pix_max = max(pixels)

# compute alpha, the parameter for f_* functions
alpha = 1+(pix_max - pix_min) / M

# stretch contrast for all pixels. f_one and f_two are the two different methods
for i in range(0,len(pixels)):
	# pixels[i] = f_one(pixels[i], alpha)
	pixels[i] = f_two(pixels[i], alpha)

# save the image
saveImage(pixels, nblines, nbcolumns)
print("Stretching done...")


