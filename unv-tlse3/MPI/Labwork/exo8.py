#!/usr/bin/python3

from mpi4py import MPI
comm = MPI.COMM_WORLD

import numpy as np
import matplotlib.image as mpimg
import matplotlib.pyplot as plt 
import matplotlib.cm as cm

size = comm.Get_size()
rank = comm.Get_rank()


# check if the size is a pair number to get all part of the image
if(size % 2 != 0):
       raise ValueError("number of processes must be devisible by 2 to get all the image part !!!")

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


def transform_part():
      pass

if rank == 0:
    # read the image
    print("Starting stretching...")
    pixels, nblines, nbcolumns = readImage()
    nblines     = np.array([nblines], dtype='i')
    nbcolumns   = np.array([nbcolumns], dtype='i')
    print(f"pixels = {pixels}")
    print(f"nbcolumns = {nbcolumns}")
    print(f"nblines = {nblines}")
    
else:
    pixels      =   None
    nblines     =   np.zeros(1, dtype='i')
    nbcolumns   =   np.zeros(1, dtype='i')


comm.Bcast(nblines, root=0)
comm.Bcast(nbcolumns, root=0)


# calculat number of element that have to be read 
local_pixels_size = (nbcolumns[0] * nblines[0] )// size

local_pixels = np.zeros(local_pixels_size, dtype='i')

comm.Scatter(pixels, local_pixels, root=0)

# compute min and max of local pixels
pix_min = min(local_pixels)
pix_max = max(local_pixels)
g_max = np.zeros(1, dtype='i')
g_min = np.zeros(1, dtype='i')
# get the global min/max and make it into all processes 
comm.Allreduce(pix_min, g_min,  op=MPI.MIN)
comm.Allreduce(pix_max, g_max, op=MPI.MAX)

# compute alpha, the parameter for f_* functions
alpha = 1+(g_max - g_min) / M

# stretch contrast for all pixels. f_one and f_two are the two different methods
for i in range(0,len(local_pixels)):
    if(rank % 2):
        local_pixels[i] = f_two(local_pixels[i], alpha)
    else:
        local_pixels[i] = f_one(local_pixels[i], alpha)

comm.Gather(local_pixels, pixels, root=0)

if rank == 0:
    # save the image
    saveImage(pixels, nblines[0], nbcolumns[0])
    print("Stretching done...")
        

