# Installing packages 
install.packages("reshape")

# importing data

train <- read.csv("~/Downloads/train.csv", stringsAsFactors=FALSE)


# First we begin by examining the data.

summary(train)

#First thing we notice is to make the survived thing a factor. Thus:
train$Survived <- as.logical(train$Survived)
train$Pclass <- as.factor(train$Pclass)
train$Sex <- as.factor(train$Sex)
train$Embarked <- as.factor((train$Embarked))

# We are missing 177 values for Age. Let us examine why?

x<-subset(train, is.na(train$Age))
# x<-subset(train, is.na(train$Age))
# summary(x)
summary(train)

# Male

male_train <- subset(train, train$Sex=="male")
female_train <- subset(train, train$Sex=="female")

# Totals

ggplot(train, aes(Sex, fill=Survived)) +
  geom_bar(position = "dodge")

# You can see that there is clearly a correlation.
# Now let's see if there is some other relationship between age and survival.

ggplot(train, aes(Age, Survived)) + 
  geom_point()

# Let us add some jitter to it
survivors<- subset(train, train$Survived==TRUE)
ggplot(train, aes(Age, as.numeric(Survived))) + 
  geom_jitter(width=0.1, height=0.1) +
  geom_smooth(method = "loess")
  
# As we can see, there is more density of points for a lower age for survive.
# Probability of surviving decreases as we get older.

# Now is there any correlation for anything else?

length("assd")
nchar("asda")
train$lengthOfName <- nchar(train$Name)

ggplot(train, aes(lengthOfName, as.numeric(Survived))) + 
  geom_jitter(width=0.1, height=0.1) +
  geom_smooth(method = "loess")

# There is a positive correlation. What could the reason be? I hypothesize that the longer the name,
# the greater the chance of you being a married female since your husband's name would be attached to yours.
# Let us see if that is true.
levels(train$Sex) <- c(1,0)
ggplot(train, aes(lengthOfName, as.numeric(Sex))) + 
  geom_jitter(width=0.1, height=0.1) +
  geom_smooth(method = "loess")
