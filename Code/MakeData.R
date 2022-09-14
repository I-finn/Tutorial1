####################
# Data import script
####################

# Packages
#library() # any packages we need will go here

# This script is for generating the height dataset

## Create a vector for height - using concatenate function
# alt: generate random set of reasonable height values rnorm(27, mean = 160, sd = 15)
height <- c(182, 171, 183, 193, 175, 173, 173, 169, 184, 179, 160, 
            168, 182, 182, 188, 172, 165, 165, 171, 173, 180, 174,
            154, 167, 180, 173, 182, 181, 165, 167, 157, 157, 185)

## Create a vector for sex
#alt: sample(c(0,1), replace=TRUE, size=27)
# 0 -> male, 1-> female
sex <-c(0, 1,0,0,0,0,0,1,0,0,1,0,0,0,0,0,1,1,1,0,0,0,1,1,1,1,0,1,1,1,1,1,0)


## Create a data.frame object from these vectors using cbind()
data <- data.frame(cbind(height, sex))

#getwd() - returns Tutorial1 directory
#data
## Save our data to a .csv file in the data directory
write.csv(data, 
          file = "Data/height.csv",     # relative to Project directory, not code
          row.names = FALSE)
