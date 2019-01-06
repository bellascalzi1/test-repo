using Images, ImageView, TestImages, Colors, FixedPointNumbers, FileIO


# AN INTRO TO VIEWS:

# If we creat two arrays like this:

a = [1,2,3,4]
b = Int.(a)

# b == a returns true, which means that the arrays have the same values
# but:

println(a === b)

# THis means that a and b are distinct objects

# However with views, a and v share the same area in memory.
v = view(a,:)


# VIews can be used to select a rectangular view of interest in an image.
# The region in the view is selected without copying any data, and
# changes are reflected in the parent.


# Another function that has similar properties is reshape()
r = reshape(collect(0.1:0.1:0.6), 3, 2)
r[1,2] = 7
a # Changes made to 'r' is reflected in 'a'


#Views for "converting" between fixed-point and raw representations


# We can use 'reinterpret' to change between representations

x= 0.5N0f8
y = reinterpret(UInt8, x)

array1 = [0.2N0f8, 0.8N0f8]
array2 = reinterpret(UInt8, array1)


# Converting between numbers and colours:

c = reshape(collect(0.1:0.1:0.6), 3, 2)
d = reshape(collect(0.2:0.1:1.0), 3, 3) # Go from 0.2 to 1.0 in o.1 increments in a 3x3 array

# converting numbers to colours. Returns a view of the original array
colv = colorview(RGB, c)

# converts colours back to numbers
chanv = channelview(colv)


# MAKING A COLOUR IMAGE OUT OF MULTIPLE GRAYSCALES:

rd = range(0,stop=1,length=11)
bl = range(0,stop=1,length=11)
img1d = colorview(RGB, rd, zeroarray, bl)

# CHANGING THE ORDER OF DIMENSIONS

# This is irrelevant I think.


# ADDING PADDING
# We can add padding if we are comparing two images of different sizes.

a1 = reshape([1,2], 2, 1)
a2 = [1.0,2.0,3.0]'

# This pads each of the arrays.
a1p, a2p = paddedviews(0, a1, a2);   # 0 is the fill value

a1p

# STACKING TWO IMAGES TOGETHER:
# We can stack two images together to make more array-like manipulations

stack1 = reshape(1:8,(2,4))
stack2 = reshape(11:18,(2,4))

sv = StackedView(stack1,stack2) # Creating the stacked view

imgMatrix =  reshape(sv,(2,8)) # Now this stacks the two images together

#Let's try something different

stackim1 = rand(RGB{Float32},2,2)
stackim2 = rand(RGB{Float32},2,2)
reshape1 = reshape(stackim1,(2,2))
reshape2 = reshape(stackim2,(2,2))
sv = StackedView(reshape1,reshape2)

# Why does this not work?
