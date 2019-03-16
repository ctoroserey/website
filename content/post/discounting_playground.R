
# sigmoidal
# n <- 100
# vers <- 20
# df <- tibble(sample = rep(seq(n), vers),
#              mid = rep(n/2, n*vers),
#              theta = rep(seq(0.09, 1, length.out = vers), each = n)) %>%
#   mutate(prob = 1 / (1 + exp(-theta * (sample - mid))))
# 
# ggplot(aes(sample, prob, group = theta), data = df) +
#   geom_line(aes(color = theta), size = 1) +
#   #geom_point() +
#   scale_color_viridis_c() +
#   theme_classic()


# hyperbolic discounting
rwd <- 10
secs <- 10
df <- tibble(time = rep(seq(1, secs, length.out = n), vers),
             k = rep(seq(0.1, 1, length.out = vers), each = n)) %>%
  mutate(disc_value = rwd / (1 + k*time))

ggplot(aes(time, disc_value, group = k, color = k), data = df) +
  geom_line(size = 1) +
  scale_color_viridis_c() +
  labs(title = paste("Discounting", rwd, "over", secs, "seconds.", sep = " ")) +
  theme_classic()