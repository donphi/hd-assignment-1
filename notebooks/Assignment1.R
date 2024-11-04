#Q1
# a

var.a = sum(c(1,2,3) + c(4,5,"6"))
# No value stored

var.a = sum(c(1,2,3) + c(4,5,6))
var.a
# change the "6" to 6 as we use c(4,5,6), this is considered a vector and vectors are Homogenous, meaning that we can only have one data type in the list

# b
var_raq = charToRaw("Welcome")
var_raq
#charToRaw converts a character string to raw bytes, in this example however the function needed to capital "T" chartoRaw() = charToRaw()

# c
.1a = "I am learning R programming."
.a = "I am learning R programming."
.a
# If a variable starts with a "." it cannot be followed by a number. Therefore we only have two options, remove the number or remove the number and period.

# d
Var-z = matrix(c(1:4, c(1,2)), nrow = 2, byrow = TRUE)
Varz = matrix(c(1:4, c(1,2)), nrow = 2, byrow = TRUE)
# Var-z is invalid, it is trying to take the variable Var and subtract z. However we have not defined either Var nor z.

#Q2

# a

var = c("Blue", "Red", "Green", "Purple", "Orange")
length(var)               
# the length() function confirms the amount of elements within this the vector, var.

# b
numbers = list(1, 4, 9, 16, 25, 36, 49)
sqrt_numbers = lapply(numbers, function(x) sqrt(x))
sqrt_numbers

#lapply is function used to apply a specific function to a list. Its output is always in the form of a list.

# c


df = data.frame(
  x = c(1, 2, 3, 4, 5, 6),
  y = c(21, 24, 7, 2, 19, 32),
  z = c(231, 112, 43, 432, 89, 23)
)

summary(df)
# The summary function give us general statistics on each variable defined within the data frame. In this case we have 3 variables each defined as a vector with 6 elements.

# d

data = read.csv('my/project/location/file.txt', header = TRUE, sep = ",")

# This functions opens a specific csv file in a specified location, you have a few options, in this case we kept the column heading and specified the separator as a ","

# e

var1 = data.frame(
  x = c(1, 2, 3, 4),
  y = c(43, 11, 9, 17)
)

var2 = data.frame(
  x = c(46, 17, 2, 9),
  y = c(16, 19, 3, 11)
)

var_comb = rbind(var1, var2)
var_comb

# rbind() function binds rows together "rows" bind. In my example I have defined data frame var1 and then added var2's rows below it

#Q3

var1 = as.integer(readline("250"))
var2 = as.integer(readline("35"))
var3 = as.integer(readline("180"))
func.1 = function(var1) {
  func.2 = function(var2) {
    var2 + var3
  }
  var3 = 1
  var1 + func.2(var1)
}
func.1(var1)
