using Images, TestImages,Colors, ImageView

# Images are really just arrays:


img = rand(2,2) # This is an image

println("dshfdsds")

# if we create an array of ints like this:

a = [1,2,3,4]



# Then all of this turns the array into floats:

convert(Array{Float64}, a)
#map(Float64,a)
#Float64.(a)

#num = a[2,1] # Second row, 1st column in a 2D array

# When we print the array in Julia, it prints it as an array not an image.
# If we want to display it as an image, we can use Colors

imgg = Gray.(img)
imgg # We can see this in the Plots view, it changes every time

# HOW IS IT REPRESENTED IN JULIA:

# Gray is just a wrapper for the underlying data type, which is a array of floats
# Gray does not change the size of the 2D array.
# Also, the 2D array and the 2D array with the gray wrapper is the same.

println(imgg == img) # This returns true.
