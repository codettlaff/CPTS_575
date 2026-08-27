library(ggplot2)

cs <- 5
math <- 6
stat <- 3
ml <- 4
dom <- 7
dvis <- 2
com <- 1

skills <- data.frame(
  skill = c("Computer Science", "Mathematics", "Statistics", "Machine Learning", "Domain Expertise", "Data Visualization", "Presentation"),
  level = c(cs, math, stat, ml, dom, dvis, com))

print(
  ggplot(skills, aes(x = skill, y = level)) +
    geom_col() +
    labs(
      title = "Data Science Skill Profile",
      x = "Skill",
      y = "Skill Level") +
    theme_minimal())

ggsave('data_science_skill_profile.png')

