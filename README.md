# ☕ Personal Coffee Consumption Analysis

This repository contains all relevant files and R scripts for analyzing **personal coffee consumption habits** and comparing them to a dataset of **U.S. coffee drinkers**. The personal dataset spans 7 weeks, while the population dataset includes nearly 4,000 survey responses gathered by a YouTuber. This project aims to uncover insights and contrasts between an individual’s coffee behavior and the broader national averages.

---

## 📦 Repository Contents

--
├── 📂 data/
│ ├── coffee population.csv
│ ├── coffee_data_personal.csv
│
├── 📂 scripts/
│ ├── coffee_habits_analysis.Rmd
│
├── 📂 output/plots/
│ ├── (generated upon knitting the Rmd)
│
├── 📂 shiny_app/
│ ├── ui.R
│ ├── server.R


---

## 💻 Software & Dependencies

### Language
- **R** (developed in RStudio)

### R Packages Used
- [`tidyverse`](https://www.tidyverse.org/) – Core data manipulation
- `dplyr` – Filtering and transformation
- `ggplot2` – Static visualizations
- `plotly` – Interactive and animated plots
- `patchwork` – Combining plots
- `ggpie` – Pie chart support
- `webr` – Nested pie charts (PieDonut)

To install required packages:
```r
install.packages("tidyverse")
install.packages("dplyr")
install.packages("ggplot2")
install.packages("plotly")
install.packages("patchwork")
install.packages("ggpie")
install.packages("webr")
```
🌐 Shiny App

Explore interactive coffee habits across age groups and compare with personal data:
🔗 https://ashritakodali.shinyapps.io/coffeehabits/
