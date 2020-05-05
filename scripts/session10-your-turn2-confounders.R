# Your Turn 2 – Confounders

# Work in groups. 
# Imagine a DGP where Y depends on X1, X2, and a third variable Z = rnorm(mean = 0, sd = 1).

# Can you estimate b1 correctly with this model?
# lm(y ~ x1 + x2, data = dat)

# *** Why? ***
# Discuss on the shared doc

set.seed(12345)
dat <- tibble(
  x1 = rnorm(n = 1000, mean = 0, sd = 1),    
  x2 = rnorm(n = 1000, mean = 0, sd = 1), 
  z = rnorm(n = 1000, mean = 0, sd = 1),     # <--- Z
  e =  rnorm(n = 1000, mean = 0, sd = 1/5)
)

# Code helpers:
a <- -0.4
b1 <- 1.2
b2 <- -0.8
b3 <- 2.7

dat <- dat %>% 
  mutate(y = a + b1 * x1 + b2 * x2 + b3 * z + e)

# this is my attempt (Dan):
a <- -0.4
b1 <- 1.2
b2 <- -0.8
b3 <- 2.7

set.seed(123456)
dat <- tibble(
  z = rnorm(n = 1000, mean = 0, sd = 1),
  x1 = rnorm(n= 1000, mean = 0, sd = 1),
  x2 = rnorm(n = 1000, mean = 0, sd = 1),
  e = rnorm(n = 1000, mean = 0, sd = 1/5)
) 

dat <- dat %>% 
  mutate(y = a + b1 * x1 + b2 * x2 + b3 * z + e)  

fit6 <- lm(y ~ x1 + x2 + z, data = dat)
fit6
fit7 <- lm(y ~ x1 + x2, data = dat)
fit7

stargazer::stargazer(fit6, fit7, type = "text", style = "apsr")
#no, lm(y ~ x1 + x2, data = dat) [fit7] can not estimate b1 correctly, while [fit6] can

