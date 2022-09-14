###############
# Data Analysis
###############

# analysing height data collected from ASDS students

# Packages
#library() # load our packages here

# Import data
data <- read.csv("Data/height.csv")

# Explore data
summary(data)
str(data)
head(data)


# Visualise
hist(data$height,
     breaks = 6,
     main = "Histogram of Height",
     xlab = "Height (cm)"
     )

plot(density(data$height),
     main = "Prpb Density Fn of Height",
     xlab = "Height (cm)"
     )

?hist
?density

# Use a QQ plot to determine if our height variable is
# normally distributed
# A QQ plot compares two distributions by plotting their quantiles against each other. 
#  Typically, the variable being “tested” is plotted on the y axis. 
#  The x axis represents the expected distribution. 
#  If the points fall roughly along the diagonal line, their distributions match.
qqnorm(data$height)
qqline(data$height,
       distribution = qnorm)

# fits for part of the sample but falls away @ 2nd mode & top end
?qqnorm

# Calculate 90 percent confidence intervals using normal distribution
CI_lower <- qnorm(0.05, 
                  mean = mean(data$height), 
                  sd = (sd(data$height)/sqrt(length(data$height))) # the equation for the standard error of the mean
)

CI_upper <- qnorm(0.95,
                  mean = mean(data$height),
                  sd = (sd(data$height)/sqrt(length(data$height)))
)

matrix(c(CI_lower, CI_upper), ncol = 2,
       dimnames = list("",c("Lower", "Upper")))

# Calculate 90 percent confidence intervals using a t distribution
se <- sd(data$height)/sqrt(length(data$height)) # Create an object with our standard error
# qt ~ qnorm, for t-dist 
t_score <- qt(.05, df = length(data$height)-1, lower.tail = FALSE)
CI_lower_t <- mean(data$height) - (se * t_score)
CI_upper_t <- mean(data$height) + (se * t_score)

# Check our working
# data vector, conf interval %, one/two-sided
t.test(data$height, conf.level = 0.9, alternative = "two.sided")
