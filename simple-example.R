
# create fictional variables
x <- c(1, 2, 3, 4, 5)
y <- c(1, 4, 3, 4, 6)

# combine into a data frame
df <- data.frame(x, y)

# plot
ggplot(df, aes(x = x, y = y)) + 
  geom_point()