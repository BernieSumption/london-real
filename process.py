from __future__ import division, absolute_import, print_function, unicode_literals

import argparse, os, sys

from math import sqrt

from array import array

TILE_SIZE = 256

def main():

    parser = argparse.ArgumentParser()
    parser.add_argument("outfile")
    conf = parser.parse_args()

    pixels = range(TILE_SIZE)
    
    OFFSET_X = 0
    OFFSET_Y = 0
    SCALE_X = 20
    SCALE_Y = 20
    
    out = array('B')
    
    for y in pixels:
        for x in pixels:
            r, g, b = get_pixel(OFFSET_X + SCALE_X * x, OFFSET_Y + SCALE_Y * y)
            out.append(r)
            out.append(g)
            out.append(b)
    
    byte_array_to_file(out, conf.outfile);


TILE_CACHE = {}

def get_pixel(x, y):
    tile_x, x_offset = divmod(int(x), TILE_SIZE)
    tile_y, y_offset = divmod(int(y), TILE_SIZE)
    try:
        tile = TILE_CACHE[tile_x, tile_y]
    except KeyError:
        TILE_CACHE[tile_x, tile_y] = tile = load_tile(tile_x, tile_y)
    
    pixel = (y_offset * TILE_SIZE + x_offset) * 3
    return tile[pixel], tile[pixel+1], tile[pixel+2]


def load_tile(x, y):
    path = "data/tiles17rgb/%s-%s.rgb" % (x, y)
    return byte_array_from_file(path)


def byte_array_from_file(path):
    size = os.path.getsize(path)
    with open(path, 'r+b') as file:
        arr = array('B')
        arr.fromfile(file, size)
        return arr
        

def byte_array_to_file(arr, path):
    with open(path, 'w+b') as file:
        arr.tofile(file)
    

if __name__ == "__main__":
    main()
