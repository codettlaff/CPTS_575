library(ggplot2)

skills <- data.frame(
  skill = c("Computer Science", "Mathematics", "Statistics", "Machine Learning",
            "Domain Expertise", "Data Visualization", "Presentation"),
  current = c(5, 6, 3, 4, 7, 2, 1),
  projected = c(5, 6, 4, 5, 7, 3, 2)
)

plot_skills <- function(data, level, title, filename, color_profile) {
  data <- data[order(-data[[level]]), ]
  data$skill <- factor(data$skill, levels = data$skill)
  
  p <- ggplot(data, aes(x = skill, y = .data[[level]], fill = skill)) +
    geom_col() +
    scale_fill_manual(values = color_profile) +
    labs(title = NULL, x = NULL, y = NULL, fill = "Skill") +
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
  ggsave(filename, p, width = 8.5, height = 6, units = "in", dpi = 300)
}

colors <- c(
  "Computer Science" = "#4E79A7",
  "Mathematics" = "#F28E2B",
  "Statistics" = "#E15759",
  "Machine Learning" = "#76B7B2",
  "Domain Expertise" = "#59A14F",
  "Data Visualization" = "#B07AA1",
  "Presentation" = "#9C755F"
)

plot_skills(
  skills, "current",
  "Data Science Skill Profile",
  "data_science_skill_profile.png",
  colors
)

plot_skills(
  skills, "projected",
  "Data Science Projected Skill Profile",
  "data_science_projected_skill_profile.png",
  colors
)
