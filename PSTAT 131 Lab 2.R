library(ggplot2)
library(tidyverse)
library(tidymodels)
library(corrplot)
install.packages("ggthemes")
library(ggthemes)
tidymodels_prefer()

diamonds %>% 
  head()

diamonds %>% 
  select(is.numeric) %>%
  cor() %>%
  corrplot(type = "lower", diag = FALSE,
           method = "color")

diamonds %>% 
  ggplot(aes(x = price, y = reorder(cut, price), fill = color)) + 
  geom_boxplot() +
  labs(y = "Cut", x = "Price") +
  theme_bw()

diamonds %>% 
  ggplot(aes(x = price, y = reorder(cut, carat))) + 
  geom_boxplot() +
  labs(y = "Cut", x = "Carat") +
  theme_bw()
             
diamonds %>% 
  ggplot(aes(x = price)) +
  geom_histogram(bins = 60) +
  theme_bw()
# Need to do Box-Cox transformation for linear regression

