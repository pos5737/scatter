
# create fictional variables
x <- c(1, 2, 3, 4, 5)
y <- c(1, 4, 3, 4, 6)

# combine into a data frame
df <- data.frame(x, y)

# plot
ggplot(df, aes(x = x, y = y)) + 
  geom_point()

ave_x <- round(mean(x), 2); ave_x
ave_y <- round(mean(y), 2); ave_y

dev_x <- x - ave_x; dev_x
d2_x <- dev_x^2; d2_x
mean(d2_x)
sd_x <- round(sqrt(mean(d2_x)), 2); sd_x

dev_y <- y - ave_y; dev_y
d2_y <- dev_y^2; d2_y
mean(d2_y)
sd_y <- round(sqrt(mean(d2_y)), 2); sd_y

x_su <- round((x - ave_x)/sd_x, 2); x_su
y_su <- round((y - ave_y)/sd_y, 2); y_su
prod <- round(x_su*y_su, 2); prod
mean(prod)
