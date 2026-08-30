library(ggplot2)

skills <- data.frame(
  skill = c("Computer Science", "Mathematics", "Statistics", "Machine Learning",
            "Domain Expertise", "Data Visualization", "Presentation"),
  current = c(5, 6, 3, 4, 7, 2, 1),
  projected = c(5, 6, 4, 5, 7, 3, 2)
)

colors <- c(
  "Computer Science" = "#4E79A7",
  "Mathematics" = "#F28E2B",
  "Statistics" = "#E15759",
  "Machine Learning" = "#76B7B2",
  "Domain Expertise" = "#59A14F",
  "Data Visualization" = "#B07AA1",
  "Presentation" = "#9C755F"
)

skills_long <- reshape(
  skills,
  varying = c("current", "projected"),
  v.names = "level",
  timevar = "profile",
  times = c("Current", "Projected"),
  direction = "long"
)

skills_long$skill <- factor(
  skills_long$skill,
  levels = skills$skill[order(-skills$current)]
)

p <- ggplot(skills_long, aes(x = skill, y = level, fill = skill)) +
  geom_col() +
  scale_fill_manual(values = colors) +
  facet_wrap(~profile, nrow = 1) +
  labs(x = NULL, y = NULL, fill = "Skill") +
  theme_minimal(base_size = 12) +
  theme(
    strip.text = element_text(size = 16),
    axis.text.x = element_blank(),
    axis.ticks.x = element_blank(),
    axis.text.y = element_blank(),
    axis.ticks.y = element_blank(),
    legend.text = element_text(size = 14),
    legend.title = element_text(size = 14)
  )

print(p)

ggsave(
  "data_science_skill_profiles.png",
  p,
  width = 8.5,
  height = 6,
  units = "in",
  dpi = 300
)