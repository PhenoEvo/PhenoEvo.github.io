###############################################################
### ADVANCED COURSE OF INTRODUCTION TO R - CIBIO, 6-10 NOVEMBER 2017
# A. Kaliontzopoulou, A. Jesús Muñoz-Pajares, P. Tarroso
###############################################################

# The WORKSPACE is everything you did in your current
# R working environment, including objects, libraries, 
# options...
#
# Using the up and down arrow keys, you will scroll through
# the command histoty of your session. You may also use
# the function history
#
history() # To see last 25 commands
history(max.show=Inf) # to see all of them
#
# At the end of a session, you will be able to save the
# entire workspace. Doing that, all the objects you 
# created will be available the next time you will 
# run R again. (NOTE: Remember that in many cases it is
# better you to save and re-run the "clean script" instead
# of storing the entire command history, probably containing
# many steps with errors and objects that probably you will
# not remember to be defined.
# 
# Yo can see all the objects contained in memory using
ls()
# If you did not store your previous session, it will be empty
# Let's create some objects:
a <- 1
b <- "letter b"
d <- matrix(3, 4)
f <- function(x){x*3}
ls()
# you can remove objects using rm
# only one object:
rm("a") # it works with and without quotes
rm(b)
# or several in a single step, typing all of them:
rm ("d", "f")
# Let's create the same objects again:
a <- 1
b <- "letter b"
d <- matrix(3, 4)
f <- function(x){x*3}
ls()

# EXERCISE:
# Now try to remove all the elements
# _without_typing_their_names_
# 
# HINT: 
# use ls() & use the help file
#
# SOLUTION:
rm(list=ls())
#
# Why did rm(ls) not work??
#
# In addition to objects, a workspàce also 
# includes options. Use the help page
# to see the large set available for setting
# everything (e.g., warnings, errors, decimals, 
# prompt, ...)
#
# See the current options using
options() 
# Something useful: changing scientific notation and decimal places
# scipen is the penalty to be applied for using scientific notation
# By default is 1
options("scipen")

set1 <- c(100, 1, 1000)
set2 <- exp(seq(-10:10))
set1
set2
# Set lower values for getting scientific notation
# and higher for getting fixed notation
options(scipen=-999)
set1
set2

options(scipen=999)
set1
set2

# By default we have 6 decimals positions.
# To control the number of significant digits(1 to 22) use:
options("digits")
# Default 7 = 6 decimal places
options(digits=1)
set2
options(digits=2)
set2

# Options will affect everything in your workspace.
pi
# For specific objects, you can use round()
options(scipen=1)
options(digits=7)
round(set2,1)
pi

# Something curious: changing prompt symbol
options(prompt="@")
options(prompt="#")
options(prompt=":)")
options(prompt="I'm Ready")
options(continue="Gimme more!!")

# You can set several options within a single call
options(prompt=">",continue="+")
# 
# So, workspaces include objects, options
# and also a working directory, that is, a
# folder in your computer where R will save
# and load files. Two functions are key at
# this point:
#
getwd()
setwd("complete/or/partial/path/to/folder")
# IMPORTANT!!!
# BECAREFUL WITH BARS IN THE PATH IF
# YOU ARE USING WINDOWS "\" vs."/".
# R uses "\" as an "escape" character (e.g., "\t").
# For that, in windows, you may type paths as:
# c:\\users\\mydocuments\\file.R
# OR
# c:/users/mydocuments/file.R
#
# To see the files contained in a folder use: 
list.files() # in the working directory
list.files("~/Dropbox/") # In other directory
# 
# Now let's import/export some data.
# VERY IMPORTANT!!: COPY THE FOLDER
# 2.3_Import_Export FROM DROPBOX TO
# ANOTHER FOLDER IN YOUR COMPUTER.
# DO NOT WORK DIRECTLY IN DROPBOX!!
#
# IMPORT DATA MATRICES FROM EXCEL
# There are may ways of doing that. 
# The most simple is saving the excel as
# a plain text file (separated by ", ", "tab"...)
#
# IMPORTANT! Names must include file extensions, 
# even if you are not able to see them with windows!
read.table(file="~/Escritorio/Exercises_Import_2.3/Example1_vector.txt")

# You can read the table by defining the file complete path (as above)
# Or you can the working directory before and read directly from the folder:
setwd("~/Escritorio/Exercises_Import_2.3")
read.table("Example1_vector.txt")

# Exercise:
# Multiply the vector you read by 7
# Remember that you must save it as an object before doing something to it!
my.vect<-read.table("~/Escritorio/Exercises_Import_2.3/Example1_vector.txt")
my.vect*7

# Despite we thought we are using a vector, it is a data.frame!!
str(my.vect)

# We read the vector using all the arguments by default. Check all the options:
?read.table

# HEADER
Matrix1<-read.table("~/Escritorio/Exercises_Import_2.3/Example2_Matrix.txt")
# Check my.vect and see if there is something wrong
# The first line should not be like this. It should be the header
Matrix2<-read.table("~/Escritorio/Exercises_Import_2.3/Example2_Matrix.txt",header=T)

# Check the impact of using a wrong option for header:
# It becomes a factor, as they have at least one element that is not a number
str(Matrix1)
str(Matrix2)

# As this is a factor, you can not multiply by 7
Matrix1*7
Matrix2*7

# Again we have error in the Matrix2! Why??
# Exercise:
# Check Matrix2 and the other default options of read.table

# Separator is "." by default, but in our case is ","
Matrix3<-read.table("~/Escritorio/Exercises_Import_2.3/Example2_Matrix.txt",header=T,dec=",")
str(Matrix3)
Matrix3*7

# Another example:
CO2.1<-read.table("~/Escritorio/Exercises_Import_2.3/Example2_Matrix.txt",header=T,dec=",")
# Problems: separator,decimal and row.names
CO2.2<-read.table("~/Escritorio/Exercises_Import_2.3/Example3_CO2.txt",header=T,dec=".",sep=";",row.names=1)

# IMPORTANT!! Always check the data set you read to fit the options!!

# Another options: reading subsets:
# Only the 4 first lines:
CO2.3<-read.table("~/Escritorio/Exercises_Import_2.3/Example3_CO2.txt",header=T,sep=";",row.names=1,nrows=4)

# Only the last 4 lines:
CO2.4<-read.table("~/Escritorio/Exercises_Import_2.3/Example3_CO2.txt",header=T,sep=";",row.names=1,skip=80)
# In that case, it doesnot make sense to use header
CO2.5<-read.table("~/Escritorio/Exercises_Import_2.3/Example3_CO2.txt",header=F,sep=";",row.names=1,skip=80)

# We can read only 8 lines from the line 15
CO2.6<-read.table("~/Escritorio/Exercises_Import_2.3/Example3_CO2.txt",header=F,sep=";",row.names=1,nrow=8,skip=15)

# Read another file, only 4 first lines: 
CO2.NA<-read.table("~/Escritorio/Exercises_Import_2.3/Example4_CO2_NA.txt",header=T,sep="\t",row.names=1,nrows=4)
str(CO2.NA)
# Some columns are still numeric and integer, because NA is interpreted as missing data
# Missing data: NA by default but it can be other
CO2.NM<-read.table("~/Escritorio/Exercises_Import_2.3/Example4_CO2_NM.txt",header=T,sep="\t",row.names=1,nrows=4)
str(CO2.NM)
# Now they are not numeric and integer anymore!
# set the missing data:
CO2.NM<-read.table("~/Escritorio/Exercises_Import_2.3/Example4_CO2_NM.txt",header=T,sep="\t",row.names=1,nrows=4,na="NotMeasured")
str(CO2.NM)
# Back to numeric and integer!

# This is more dangerous if missing data are stored as numbers (e.g., -99)
CO2.99<-read.table("~/Escritorio/Exercises_Import_2.3/Example4_CO2_99.txt",header=T,sep="\t",row.names=1,nrows=4)
str(CO2.99)
# Now the columns are numeric and integer, but it should be like this:
CO2.99<-read.table("~/Escritorio/Exercises_Import_2.3/Example4_CO2_99.txt",header=T,sep="\t",row.names=1,nrows=4,na=-99)
str(CO2.99)

######

# After opening (and working with the data) you can store the data.
# Again check all the options available, that are almost the same than before.
? write.table

# We can save the object CO2.99, with NA, separator as space, without row names:
write.table(CO2.99, file="New_CO2_99.txt", sep=" ", dec=".",na="NA")
# As before, this will be stored in you working directory
# You can specify a complete path
write.table(CO2.99, file="~/Dropbox/New_CO2_99.txt", sep=" ", dec=".",na="NA")

# New options:
# append = FALSE, quote = TRUE

write.table(CO2.99, file="New_CO2_99.txt", sep=" ", dec=".",na="NA",append=T,quote =F,col.names=F)
# Add the content to the file
write.table(CO2.99, file="New_CO2_99.txt", sep=" ", dec=".",na="NA")



# REMEMBER
# If you need to read/save a file that is
# in a different folder, you may either
# set your wd to this folder or 
# include the entire path when inporting/exporting
#


# Exercises #########################
# 1. Download the "import_export_exercise.zip" file and uncompress it.
# 2. Change the working directory to the folder "import_export_exercise".
# 2. Read and create objects using the example files contained in the folder "Exercise_Import".
# 3. Save them to the folder "Exercise_Export

# There are also specific packages for reading excel files, as
# also for reading phylogenetic trees, microsatellite data, ....
# Check the help file of each function before using it!
# 

# read.csv(file, header = TRUE, sep = ", ", quote = "\"", 
#              dec = ".", fill = TRUE, comment.char = "", ...)
     
#     read.csv2(file, header = TRUE, sep = ";", quote = "\"", 
#               dec = ", ", fill = TRUE, comment.char = "", ...)
     
#     read.delim(file, header = TRUE, sep = "\t", quote = "\"", 
#                dec = ".", fill = TRUE, comment.char = "", ...)
     
#     read.delim2(file, header = TRUE, sep = "\t", quote = "\"", 
#                 dec = ", ", fill = TRUE, comment.char = "", ...)

