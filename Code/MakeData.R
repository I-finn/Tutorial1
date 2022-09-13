####################
# Data import script
####################

# Packages
#library() # any packages we need will go here

# We should add a short note here to explain what we're doing in 
# this script

## Create a vector for height
height <- c()#rnorm(27, mean = 160, sd = 15)

## Create a vector for sex
sex <- c()#sample(c(0,1), replace=TRUE, size=27)

## Create a data.frame object from these vectors using cbind()
data <- data.frame(cbind(height, sex))

## Save our data to a .csv file in the data directory
write.csv(data, 
          file = "Data/height.csv",
          row.names = FALSE)
