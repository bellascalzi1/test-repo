using Images, TestImages,Colors, ImageView, CoordinateTransformations

imgref = load("cameraman.png")
img = load("cmrot.png")
tfm = recenter(RotMatrix(-π/8),center(img)) # What does this exactly do?

imgrot = warp(img,tfm)

summary(img)
summary(imgrot)

imgov = colorview(RGB, paddedviews(0, img, imgrot, zeroarray)...)

imgov_ref = colorview(RGB, paddedviews(0, imgref, imgrot, zeroarray)...)
