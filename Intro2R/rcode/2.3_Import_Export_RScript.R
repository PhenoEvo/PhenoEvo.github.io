

################
## Workspace
################

The workspace is everything you did in your current R working environment including objects, libraries, options... At the end of a session, you will be able to save the entire workspace. Doing that, all the objects you created will be available the next time you will run R again. **NOTE**: Remember that in many cases it is better to save and re-run the "clean script" instead of storing the entire command history, probably containing many steps with errors and objects that probably you will not remember being defined.

You can see all the objects contained in memory using the `ls()` function. If you did not store your previous session, it will be empty:
  
ls()

# Let's create some objects:
a <- 1
b <- "letter b"
d <- matrix(3, 4)
f <- function(x){x*3}
ls()

# You can remove objects using `rm()`.
# To remove only one object:
rm("a")
rm(b)

# To remove several objects in a single step you can type the names of all of them:
rm("d", "f")

# Let's create the same objects again:
a <- 1
b <- "letter b"
d <- matrix(3, 4)
f <- function(x){x*3}
ls()

# To remove all the elements without typing their names:
rm(list=ls())
ls()


#######################
## Working directory
#######################

# The working directory is a folder in your computer where R will save and load files. 
# Two functions are key at this point.

# To know which your current working directory is:
getwd()

# To change your working directory to other folder:
setwd("complete/or/partial/path/to/folder")


# IMPORTANT! Be careful with bars in the path if you are using WINDOWS. `\` and `/` mean different things. 
# R uses `\` as an "escape" character (e.g., "\t"). 
# For that, in windows, you may type paths as "c:\\users\\mydocuments\\file.R" or "c:/users/mydocuments/file.R"

# In Rstudio, you can also set the working directory manually.

# To see the files contained in the working directory folder use: 
list.files()

# And in any other folder:
list.files("~/Documents/")


################################
## Importing / Exporting data
################################

# Import data matrices from Excel

# There are may ways of doing that. The most simple way is by saving the excel file as a 
# plain text file (separated by ",", ";", "tab", ...). Then, we can use the read.table() function
# to read in the data. 

# IMPORTANT! Names must include file extensions, even if you are not able to see them in some 
# operating systems (e.g. windows).

# We will start by reading an example vector:
read.table(file="2.3_Import/Example1_vector.txt")

# You can read the table by defining the file's complete path (as above) or you can set the working directory 
# before and read directly from the folder:
setwd("2.3_Import/")
read.table("Example1_vector.txt")

# We read the vector using all the arguments by default. Check all the options:
?read.table

# Now read an example matrix:
setwd("2.3_Import/")
Matrix1 <- read.table("Example2_Matrix.txt")

# Check Matrix1 and see if there is something wrong.
str(Matrix1)

# The first line should not be like this, but it should be the header. 
# The impact of using a wrong option for header is huge. The data inside the matrix becomes a factor, 
# as they have at least one element that is not a number. To avoid that from happening:
Matrix2 <- read.table("Example2_Matrix.txt", header=T)
str(Matrix2)

# As the first column is a factor, you can not multiply the matrix by a number (e.g. 7):
Matrix1*7

Matrix2*7

# Again we have error in the Matrix2! Why?? 
# Check Matrix2 and the other default options of read.table. 
Matrix3 <- read.table("Example2_Matrix.txt", header=T, dec=",")
str(Matrix3)

Matrix3*7

# Another example:
CO2.1 <- read.table("Example3_CO2.txt", header=T, dec=",")
str(CO2.1)

# As always check for potential problems: header, decimal, separator, and row.names:
CO2.2 <- read.table("Example3_CO2.txt", header=T, dec=".", sep=";", row.names=1)
str(CO2.2)


# IMPORTANT! Always check the dataset you read to fit the options!!

# SAVING
# After opening (and working with the data) you can save the data in your computer. 
# Again check all the options available, that are almost the same than before.
?write.table

# For conveniency we can save the object CO2.2, with NA, separator as space, and without row names:
write.table(CO2.2, file="New_CO2_2.txt", sep=" ", dec=".", na="NA")

# As before, this will be stored in you working directory. 
# Alternatively you can specify another (complete) path to save the dataset:
write.table(CO2.2, file="~/Dropbox/New_CO2_2.txt", sep=" ", dec=".", na="NA")


# REMEMBER: If you need to read/save a file that is in a different folder, you may either 
# set your working directory to this folder or include the entire path when inporting/exporting.


##############
## Exercises
##############

1. Download the "import_export.zip" file and uncompress it.
2. Change the working directory to the folder 2.3_Import.
2. Read and create objects using the example files.
3. Save them to the folder 2.3_Export

# In all cases, save files using commas as column separator with column names and without row names.

# There are also specific packages for reading excel files, as also for reading phylogenetic trees, 
# microsatellite data, etc. Check the help file of each function before using them!

read.csv(file, header = TRUE, sep = ", ", quote = "\"",
         dec = ".", fill = TRUE, comment.char = "", ...)

read.csv2(file, header = TRUE, sep = ";", quote = "\"",
          dec = ", ", fill = TRUE, comment.char = "", ...)

read.delim(file, header = TRUE, sep = "\t", quote = "\"",
           dec = ".", fill = TRUE, comment.char = "", ...)

read.delim2(file, header = TRUE, sep = "\t", quote = "\"",
            dec = ", ", fill = TRUE, comment.char = "", ...)



