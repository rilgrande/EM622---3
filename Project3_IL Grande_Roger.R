
# Roger IL Grande
# EM-622 Project 3


# Load the necessary libraries
library(ggplot2)
library(RColorBrewer)
library(maps)
library(mapproj)
library(treemap)
library(dplyr)
library(reshape)
library(grid)

# Set working directory
setwd("~/Documents/R Projects")


# Q1: Is there a relationship between age group and malignancy for women who did not receive radiation therapy, and how does this relationship compare to women who did receive radiation therapy?
# I will align the average tumor size for each group to analyze if this is a factor in the decision.

# Import the breast cancer dataset
breast_cancer <- read.csv("breast-cancer.csv")
View(breast_cancer)

str(breast_cancer) # Check if the data are imported as correct forms (all look correct)

sum(is.na(breast_cancer)) # Count the number of cells that contain missing values (no missing values)

# Subset for age group, degree malignant, average tumor size columns
bc_subset <- subset(breast_cancer, select = c('age', 'deig.malig', 'tumor.size', 'irradiat'))
bc_subset <- filter(bc_subset, deig.malig == 1 | deig.malig == 3) # Filter data to look at malignant (1) or highly abnormal (3)


# Double bar chart plot for age group on x axis, number malignant (1) and number highly abnormal (3) for irradiat = no on y axis

# Re-format the data into a frequency table, and convert table to dataframe
frequency_set_1 <- with(bc_subset, table(irradiat, age, deig.malig, tumor.size))
frequency_set_1 <- as.data.frame(frequency_set_1)
frequency_set_1$tumor.size <- as.integer(as.character(frequency_set_1$tumor.size))
View(frequency_set_1)

# Filter data for declined radiation therapy group
no_radiation <- filter(frequency_set_1, irradiat == 'no')
View(no_radiation)

# Filter data for elected radiation therapy group
yes_radiation <- filter(frequency_set_1, irradiat == 'yes')
View(yes_radiation)

# No radiation therapy grouped bar plot
plot1 <- ggplot(no_radiation, aes(fill=deig.malig, y=Freq, x=age)) + 
  geom_bar(position="dodge", stat="identity", width = 0.5) +
  scale_fill_manual(values = c("#7BAD56", "#B53737"), name = "Key", labels = c("Malignant", "Abnormal"))

# Add axis titles, resize binwidth, centered plot title, and caption
plot1 + labs(title = "No Radiation Therapy Group", x = "Age Group", y = "Frequency") + theme(plot.title = element_text(hjust = 0.5))

# Yes radiation therapy grouped bar plot
plot2 <- ggplot(yes_radiation, aes(fill=deig.malig, y=Freq, x=age)) + 
  geom_bar(position="dodge", stat="identity", width = 0.5) +
  scale_fill_manual(values = c("#7BAD56", "#B53737"), name = "Key", labels = c("Malignant", "Abnormal"))

# Add axis titles, resize binwidth, centered plot title, and caption
plot2 + labs(title = "Radiation Therapy Group", x = "Age Group", y = "Frequency") + theme(plot.title = element_text(hjust = 0.5))


# Filter out age groups for yes and no radiation, malignant and not malignant

thirties_no1 <- filter(no_radiation, age == "30-39", deig.malig == 1)

fourties_no1 <- filter(no_radiation, age == "40-49", deig.malig == 1)

fifties_no1 <- filter(no_radiation, age == "50-59", deig.malig == 1)

sixties_no1 <- filter(no_radiation, age == "60-69", deig.malig == 1)

seventies_no1 <- filter(no_radiation, age == "70-79", deig.malig == 1)

thirties_yes1 <- filter(yes_radiation, age == "30-39", deig.malig == 1)

fourties_yes1 <- filter(yes_radiation, age == "40-49", deig.malig == 1)

fifties_yes1 <- filter(yes_radiation, age == "50-59", deig.malig == 1)

sixties_yes1 <- filter(yes_radiation, age == "60-69", deig.malig == 1)

seventies_yes1 <- filter(yes_radiation, age == "70-79", deig.malig == 1)

View(thirties_no1)

thirties_no3 <- filter(no_radiation, age == "30-39", deig.malig == 3)

fourties_no3 <- filter(no_radiation, age == "40-49", deig.malig == 3)

fifties_no3 <- filter(no_radiation, age == "50-59", deig.malig == 3)

sixties_no3 <- filter(no_radiation, age == "60-69", deig.malig == 3)

seventies_no3 <- filter(no_radiation, age == "70-79", deig.malig == 3)

thirties_yes3 <- filter(yes_radiation, age == "30-39", deig.malig == 3)

fourties_yes3 <- filter(yes_radiation, age == "40-49", deig.malig == 3)

fifties_yes3 <- filter(yes_radiation, age == "50-59", deig.malig == 3)

sixties_yes3 <- filter(yes_radiation, age == "60-69", deig.malig == 3)

seventies_yes3 <- filter(yes_radiation, age == "70-79", deig.malig == 3)

View(thirties_yes3)


# Create plots for average tumor size for yes and no radiation groups

no_avg_tumor_size1 <- c(mean(thirties_no1$tumor.size), mean(fourties_no1$tumor.size), mean(fifties_no1$tumor.size), mean(sixties_no1$tumor.size), mean(seventies_no1$tumor.size))
no_avg_tumor_size1

yes_avg_tumor_size1 <- c(mean(thirties_yes1$tumor.size), mean(fourties_yes1$tumor.size), mean(fifties_yes1$tumor.size), mean(sixties_yes1$tumor.size), mean(seventies_yes1$tumor.size))
yes_avg_tumor_size1

no_avg_tumor_size3 <- c(mean(thirties_no3$tumor.size), mean(fourties_no3$tumor.size), mean(fifties_no3$tumor.size), mean(sixties_no3$tumor.size), mean(seventies_no3$tumor.size))
no_avg_tumor_size3

yes_avg_tumor_size3 <- c(mean(thirties_yes3$tumor.size), mean(fourties_yes3$tumor.size), mean(fifties_yes3$tumor.size), mean(sixties_yes3$tumor.size), mean(seventies_yes3$tumor.size))
yes_avg_tumor_size3

# Create age group column for the new data frames

age <- c("30-39", "40-49", "50-59", "60-69", "70-79")

# Create the two new data frames to be plotted
df.no_avg_tumor_size1 <- data.frame(age, no_avg_tumor_size1, no_avg_tumor_size3)

df.yes_avg_tumor_size1 <- data.frame(age, yes_avg_tumor_size1, no_avg_tumor_size3)


# Plot these data frames in line plots

no_avg_tumor_size_plot <- ggplot(df.no_avg_tumor_size1) + geom_line(aes(y = no_avg_tumor_size1, x = age, group = 1, lwd = 0.1)) # Set the source dataset and columns used for each axis
no_avg_tumor_size_plot + labs(title = "No Radiation Average Tumor Size", x = "Age", y = "Average Size") + theme(plot.title = element_text(hjust = 0.5), legend.position = "None") # Add axis titles, centered plot title, and caption
no_avg_tumor_size_plot + scale_color_manual(values = c("#2A9DF4"))

yes_avg_tumor_size_plot <- ggplot(df.yes_avg_tumor_size1) + geom_line(aes(y = yes_avg_tumor_size1, x = age, group = 1, lwd = 0.1)) # Set the source dataset and columns used for each axis
yes_avg_tumor_size_plot + labs(title = "Yes Radiation Average Tumor Size", x = "Age", y = "Average Size") + theme(plot.title = element_text(hjust = 0.5), legend.position = "None") # Add axis titles, centered plot title, and caption
yes_avg_tumor_size_plot + scale_color_manual(values = c("#2A9DF4"))


# Stack all four plots vertically
grid.newpage()
grid.draw(rbind(ggplotGrob(plot1), ggplotGrob(no_avg_tumor_size_plot), ggplotGrob(plot2), ggplotGrob(yes_avg_tumor_size_plot), size = "last"))



# Q2 Heat Map Question: What is a sample of Airbnb options for Brooklyn private rooms with more than 250 reviews?

# Import the Airbnb dataset to prepare a table heat map
airbnb <- read.csv("AB_NYC_2019.csv")
head(airbnb)

View(airbnb)


# Manipulation: Create a subset of data
private_airbnb <- subset(airbnb, select = c('host_name', 'neighbourhood_group', 'room_type', 'price', 'minimum_nights', 'number_of_reviews', 'availability_365'), room_type == "Private room")

Brooklyn_airbnb <- subset(private_airbnb, neighbourhood_group == "Brooklyn") # Brooklyn subset

reviews_airbnb <- subset(Brooklyn_airbnb, number_of_reviews > 250) # Greater than 250 reviews

reviews_airbnb <- reviews_airbnb[order(reviews_airbnb$price),] # Sort by increasing price

reviews_airbnb <- subset(reviews_airbnb, select = c('price', 'minimum_nights', 'availability_365', 'number_of_reviews')) # Subset with these columns only

View(reviews_airbnb)


# Pick 10 random listings in this subset (just for fun)
random_sample_airbnb <- sample_n(reviews_airbnb, 10)
View(random_sample_airbnb)


# Set row names for the dataframe
reviews_airbnb <- distinct(reviews_airbnb, number_of_reviews, .keep_all= TRUE) # Remove duplicate review numbers
row.names(reviews_airbnb)
row.names(reviews_airbnb) <- reviews_airbnb$number_of_reviews
row.names(reviews_airbnb)

# Convert the dataset to matrix form
reviews_matrix <- data.matrix(reviews_airbnb)

# Clean the canvas
dev.off()

dev.set(dev.next())

# Create a table heat map
reviews_heatmap <- heatmap(reviews_matrix, Rowv = NA, Colv = NA, margins = c(1, 1),
                       col = brewer.pal(9, "Reds"), scale = "column",
                       main = "Airbnb Listings with # of Reviews")


# Q2 Tree Map Question: How many Airbnb reviews are written in each neighborhood within Manhattan, Brooklyn, and Queens?

treemap_airbnb <- subset(airbnb, price > 200) # Looking at higher priced subset of listings

treemap_airbnb <- filter(treemap_airbnb, neighbourhood_group=='Manhattan' | neighbourhood_group=='Brooklyn' | neighbourhood_group=='Queens') # Filtering down to just Manhattan, Brooklyn, Queens

View(treemap_airbnb)
# Create the treemap
tree_map <-treemap(treemap_airbnb, index = c("neighbourhood_group", "neighbourhood"), vSize="number_of_reviews", vColor="price",fontsize.labels=c(30,11),type ="value",title ="Number of Airbnb Reviews vs Cumulative Price",palette="RdYlBu")


