using Images, TestImages,Colors, ImageView, CoordinateTransformations

clem = load("clem.jpg")

tfm = recenter(RotMatrix(-π/20),[20,20])

imgrot = warp(clem, tfm)
