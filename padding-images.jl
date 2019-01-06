using Images, ImageView, TestImages, Colors, FixedPointNumbers, FileIO

# This script makes the dolores image the same size as the clementine image.
clem = load("clem.jpg")
dolores = load("dolores.jpg")

clem2, dolores2 = paddedviews(RGB{Float32}(0,0,0),clem,dolores)

clem2
dolores2
