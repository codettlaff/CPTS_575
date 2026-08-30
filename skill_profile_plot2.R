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

# Sort skills from highest to lowest current level
skills <- skills[order(-skills$current), ]
skills$skill <- factor(skills$skill, levels = skills$skill)

# Assign colors explicitly
skills$bar_color <- colors[as.character(skills$skill)]

p <- ggplot(skills, aes(x = skill)) +
  
  # Current: solid bars
  geom_col(
    aes(y = current, fill = bar_color),
    width = 0.7
  ) +
  
  # Projected: transparent bars with dashed outlines
  geom_col(
    aes(y = projected, color = bar_color),
    fill = NA,
    linewidth = 1.2,
    linetype = "dashed",
    width = 0.7
  ) +
  
  scale_fill_identity(
    name = "Skill",
    breaks = skills$bar_color,
    labels = skills$skill,
    guide = "legend"
  ) +
  
  scale_color_identity(
    name = "Projected",
    guide = "none"
  ) +
  
  labs(x = NULL, y = NULL) +
  
  theme_minimal(base_size = 12) +
  theme(
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