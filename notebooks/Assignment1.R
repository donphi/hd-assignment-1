#Q1
# a

var.a = sum(c(1,2,3) + c(4,5,"6"))
# No value stored

var.a = sum(c(1,2,3) + c(4,5,6))
var.a
# change the "6" to 6 as we use c(4,5,6), this is considered a vector and vectors are Homogenous, meaning that we can only have one data type in the list

# b
var_raq = chartoRaw("Welcome")
# Could not find chartoRaw("Welcome")

var_raq = charToRaw("Welcome")
var_raq
#charToRaw converts a character string to raw bytes, in this example however the function needed to capital "T" chartoRaw() = charToRaw()

# c
.1a = "I am learning R programming."
.a = "I am learning R programming."
.a
# If a variable starts with a "." it cannot be followed by a number. Therefore we only have two options, remove the number or remove the number and period.

# d
Var = 3
Var-z = matrix(c(1:4, c(1,2)), nrow = 2, byrow = TRUE)
Varz = matrix(c(1:4, c(1,2)), nrow = 2, byrow = TRUE)
Varz
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
df
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

# Re-frame and rewrite Q3 to follow along easier
# Incorrect
var1 = 250
var2 = 35
var3 = 180

func.1 = function(var1) {
  func.2 = function(var2) {var2 + var3} # Statement 1 = 35 + 180 = 210
  var3 = 1 # Statement 2
  var1 + func.2(var1) # Statement 3 = 250 + (250 + 1) = 501
}
func.1(var1) # func.1(var1) = 501; this line determines the value of func.1(var1)

# However we expect func.1(var1) = 286

# Correction in line 2, func.2 = function(var2), var2 needs to change to var1
# Correct
var1 = 250
var2 = 35
var3 = 180

func.1 = function(var1) {
  func.2 = function(var1) {var2 + var3} # change var2 to var1, Statement 1 = 35 + 180 = 210
  var3 = 1 # Statement 2
  var1 + func.2(var1) # Statement 3 = 250 + (35 + 1) = 286, here you will notice that var3 has been overridden by var3 = 1
}
func.1(var1) # func.1(var1) = 286

#Q4
# a

# Sets the working directory for either my Windows PC or Macbook Laptop
setwd("D:/Dropbox/Personal/Education/Westminister University/Notion Documents/Health Data Science/Assignment") # Windows
setwd("/Users/donaldphilp/Dropbox (Personal)/Personal/Education/Westminister University/Notion Documents/Health Data Science/Assignment") #Mac

# Loads the table with including the header and "," separator
dataset_csv = read.table("abalone.data", header = TRUE, sep = ",")
# Prints the head of the table
head(dataset_csv)
# Prints the first 5 entries
summary(dataset_csv)

# Define the column names as specified in the details of the dataset website
column_names = c('Sex', 'Length', 'Diameter', 'Height', 'Whole_weight', 'Shucked_weight', 'Viscera_weight', 'Shell_weight', 'Rings')
# Add the col.names called column_names that we defined previously
dataset_csv = read.table("abalone.data", header = TRUE, col.names = column_names, sep = ",")
# Prints the first 5 entries
head(dataset_csv)

# b
# Define a variable character vector with a length of the column 'Sex' in the dataset_csv table
group = character(length(dataset_csv$Sex))

# Create a for loop each value s from number 1: all the way to the end of the data_set_csv table, which is the length of the table
for(s in 1:length(dataset_csv$Sex)) {
  # if dataset_csv Sex column equals 'M' indicating male
  if(dataset_csv$Sex[s] == "M") {
  # if true, assigns "male_group" tot the s-th position in group vector  
    group[s] = "male_group"
  # otherwise if dataset_csv Sex column equals 'F' indicating female 
  }else if (dataset_csv$Sex[s] == "F"){
  # if true, assigns "female_group" tot the s-th position in group vector
    group[s] = "female_group"
  # if dataset_csv Sex column equals 'I' indicating Infant
  }else if (dataset_csv$Sex[s] == "I"){
  # if true, assigns "infant_group" tot the s-th position in group vector  
    group[s] = "infant_group"
  # if there is any other value than 'M', 'F' or 'I', print out the line of this error
  }else { print(paste('There is something other than M, F or I on line:', s)) }
}
# Create a new variable and bind the columns of dataset_csv to each vector in the group variable
dataset_csv.new <- cbind(dataset_csv, group)

# Create a subset data frame for "female_group" that was specified in the Vector
female_group = subset.data.frame(dataset_csv.new, group == "female_group")
# Create a subset data frame for "Male_group" that was specified in the Vector
male_group = subset.data.frame(dataset_csv.new, group == "male_group")
# Create a subset data frame for "Infant_group" that was specified in the Vector
infant_group = subset.data.frame(dataset_csv.new, group == "infant_group")

# We now have 3 data frames each for the different "Sex" categories.

# Display the amount of rows in the data frame infant_group
nrow(infant_group)
# Display the amount of rows in the data frame male_group
nrow(male_group)
# Display the amount of rows in the data frame female_group
nrow(female_group)

# 1527 males, 1307 females and 1342 infants

# c
# Create a new column in the dataset_csv and add NA to all

# Run a for loop a from 1 to the number of rows in the dataset_csv  
for (a in 1:nrow(dataset_csv)) {
  # Running though each line and changing the value of a as the new value of the Age column by Rings + 1.5
  dataset_csv$Age[a] = (dataset_csv$Rings[a] + 1.5)
}
# This prints out the changed table with included Ages
View(dataset_csv)
  
# d
for (a in 1:nrow(male_group)) {
  male_group$Age[a] = (male_group$Rings[a] + 1.5)
}
for (a in 1:nrow(female_group)) {
  female_group$Age[a] = (female_group$Rings[a] + 1.5)
}
male_ave_age = round(mean(male_group$Age), 2)
female_ave_age = round(mean(female_group$Age), 2)

if (male_ave_age >= female_ave_age) {
  print(paste("The male abalone average age,", male_ave_age, ",is more than the female abelone average age of", female_ave_age))
}else{
  print(paste("The male abalone average age,", male_ave_age,",is less than the female abelone average age of", female_ave_age))
}

# e
whole_w = dataset_csv$Whole_weight
shucked_w = dataset_csv$Shucked_weight
viscera_w = dataset_csv$Viscera_weight
shell_w = dataset_csv$Shell_weight

weight_group = subset.data.frame(dataset_csv, whole_w > shell_w + viscera_w + shucked_w)

View(weight_group)

dim(dataset_csv)
dim(weight_group)

# f
size_filter = subset.data.frame(dataset_csv, dataset_csv$Diameter > 0.5 & dataset_csv$Height < 0.2)

View(size_filter)

dim(dataset_csv)
dim(size_filter)

#Q5
x = 2.1
y = 1.1
z = 2.5

outer_function = function(x, y, z) {
  inner_function = function(x, y) {
    return((x*y) + 3.56)
  }
  if(n <= 1) {
      return(FALSE) # return the result to the outer function
    for(i in 2:(sqrt(n)) 
        result %% 2 != 0# take the incoming number and if its greater than 1 then add a square root the number to check the total number of divisions 
  }                 #
      & is_prime == 2 
      & is_prime %% 2 != 0) == TRUE) {
    return(result * z)
  is_prime = inner_function(x, y)
  
  }else{ return(result) 
  }
}

outer_function(1,1,1) 

#Q6

# Dataset Q6-File1.csv, Load csv file, header = true and separator = ","
Q6_File1 = read.csv("Q6-File1.csv", header = TRUE, sep = ",")

# Display dimension of data frame Q6_File1
dim(Q6_File1)

# Display Feature Names
colnames(Q6_File1)

# Dataset Q6-File2.csv Load csv file, header = true and separator = ","
Q6_File2 = read.csv("Q6-File2.csv", header = TRUE, sep = ",")

# Display dimension of data frame Q6_File2
dim(Q6_File2)

# Display Feature Names
colnames(Q6_File2)

# sapply Data Frame all numeric columns
continuous_Q6_1 = sapply(Q6_File1, is.numeric)

# sapply Data Frame all numeric columns
continuous_Q6_2 = sapply(Q6_File2, is.numeric)

# Apply boxplot to Q6_File1 CSV and use Continuous value by booleans specification 
boxplot(Q6_File1[,continuous_Q6_1], 
        main = "Box Plot Q6 File1", col = "skyblue")

# Apply boxplot to Q6_File2 CSV and use Continuous value by booleans specification
boxplot(Q6_File2[,continuous_Q6_2], 
        main = "Box Plot Q6 File2", col = "pink")



# Q6 b

# For loop from index 1:last row of Q6_File2 substr remove first character and adding to new $PatientID column
for (f in 1:nrow(Q6_File2)) {
  Q6_File2$PatientID[f] = substr(Q6_File2$Reference_ID[f], 1, 1)
}
# Check new column $PatientID
head(Q6_File2)

# Merge File1 with File2 by PatientID
data_merge = merge(Q6_File1, Q6_File2, by = "PatientID")

# Check new data frame data_merge
head(data_merge)

# Convert all Protein columns to Numeric
data_merge$Protein.1 = as.numeric(data_merge$Protein.1)
data_merge$Protein.2 = as.numeric(data_merge$Protein.2)
data_merge$Protein.3 = as.numeric(data_merge$Protein.3)
data_merge$Protein.4 = as.numeric(data_merge$Protein.4)
data_merge$Protein.5 = as.numeric(data_merge$Protein.5)
data_merge$Protein.6 = as.numeric(data_merge$Protein.6)
data_merge$Protein.7 = as.numeric(data_merge$Protein.7)
data_merge$Protein.8 = as.numeric(data_merge$Protein.8)
data_merge$Protein.9 = as.numeric(data_merge$Protein.9)
data_merge$Protein.10 = as.numeric(data_merge$Protein.10)

# Create an empty numeric column called mean_protein
data_merge$mean_protein = numeric(nrow(data_merge))

# Loop through each protein adding them and dividing by 10
for (p in 1:nrow(data_merge)) {
  data_merge$mean_protein[p] = 
    (data_merge$Protein.1[p] +
    data_merge$Protein.2[p] +
    data_merge$Protein.3[p] +
    data_merge$Protein.4[p] +
    data_merge$Protein.5[p] +
    data_merge$Protein.6[p] +
    data_merge$Protein.7[p] +
    data_merge$Protein.8[p] +
    data_merge$Protein.9[p] +
    data_merge$Protein.10[p]) / 10
}

# Set threshold to 500
threshold = 500

# Create a blank character vector with a length the size of the data_merge df
threshold_group = character(nrow(data_merge))

# Loop through the mean_protein column and add NA to missing
for (t in 1:nrow(data_merge)) {
  if (is.na(data_merge$mean_protein[t])) {
    threshold_group[t] = "missing"
# Add mean_protein threshold to available values
  }else if (data_merge$mean_protein[t] <= threshold){ 
    threshold_group[t] = "within_threshold"
  }else{
    threshold_group[t] = "outside_threshold"
  }
}
# add new column
data_merge$threshold_group = threshold_group

# Create new data frame which only includes the "within_threshold" range
thresh_new <- subset(data_merge, threshold_group == "within_threshold")

# Print a table form listing the current groups
print(table(data_merge$threshold_group))

