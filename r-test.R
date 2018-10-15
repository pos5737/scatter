
# load packages
library(tidyverse)

# set seed for reprodicible random number generation
set.seed(1234)

# generate a collection of random data sets
n_data_sets <- 16
n <- c(25, 100, 1000)
df <- NULL
for (i in 1:n_data_sets) {
  r <- round(runif(1, -1, 1), 2)
  n0 <- sample(n, 1)
  V <- diag(2)
  V[1, 2] <- V[2, 1] <- r
  D <- MASS::mvrnorm(n0, mu = c(0, 2), Sigma = V)
  df0 <- data_frame(x = D[, 1], y = D[, 2], dataset = paste("Data Set", i))
  df <- bind_rows(df, df0)
}

gg <- ggplot(df, aes(x = x, y = y)) + 
  geom_point() + 
  facet_wrap(vars(dataset))
ggsave("r-test.pdf", plot = gg, height = 10, width = 8)

r_df <- df  %>%
  group_by(dataset) %>%
  summarize(r = cor(x,y)) %>%
  glimpse()

gg2 <- gg + geom_text(data = r_df, aes(x = Inf, y = Inf, label = paste("r = ", round(r, 2))),
               hjust = 1, vjust = 1)
ggsave("r-test-sol.pdf", plot = gg2, height = 10, width = 8)


                                