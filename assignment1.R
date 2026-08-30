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
  data$bar_color <- color_profile[as.character(data$skill)]
  
  p <- ggplot(data, aes(x = skill, y = .data[[level]], fill = bar_color)) +
    geom_col() +
    scale_fill_identity() +
    labs(title = title, x = "Skill", y = "Skill Level") +
    theme_minimal(base_size = 12) +
    theme(legend.position = "none")
  
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
