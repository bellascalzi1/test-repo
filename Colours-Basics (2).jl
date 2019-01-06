using Images, ImageView, TestImages, Colors

imgc = rand(RGB{Float32},2,2)

imshow(imgc) # Use this to show the image

# in Julia, each element in the array is a pixel.
# we can extract the red val from one pixel by doing this:
println(red(imgc[1,1]))

# Run this to get all RGB values
dump(imgc[1,1])

# Another way to get all values
c = imgc[1,1]; (red(c), green(c), blue(c))

# Convert values to BGR:
dump(convert(BGR,c))

# Can also convert the pixel to a single 32-bit integer (Alpha,R,G,B)
c24 = convert(RGB24,c); dump(c24)
println(c24)
println(c24.color)

# Extract colours:
# N0f8 = "Normalized with 8 fractional bits, with 0 bits left for representing values higher than 1"

c24red = red(c24); println("c24 Red Channel: "); println(c24red)
c24green = green(c24); println("c24 Green Channel: "); println(c24green)
c24blue = blue(c24); println("c24 BLue Channel: "); println(c24blue)

# WHEN FINDING AVERAGE COLOUR OF IMAGE: USE Float32, Gray{Float64}, or RGB{Float32}
