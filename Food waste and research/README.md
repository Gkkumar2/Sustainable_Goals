# 🌍 Global Food Waste Analysis

**Project Date:** July 20, 2025  
**Author:** Gihan Kavinda Kumar  

## 📝 Overview
This project provides a comprehensive analysis of the **Food Waste data and research - by country** dataset based on the UNEP Food Waste Index Report. The aim is to clean and analyze global food waste patterns and demonstrate advanced data processing techniques using SQL and Python.

## 📦 Dataset

**Source:** `Food Waste data and research - by country.csv`  
**Description:** Contains food waste estimates for 214 countries and territories.

### Key Columns:
- `combined_figures_kg_capita_year`: Total food waste per person per year.
- `household_estimate_kg_capita_year`: Waste from households.
- `retail_estimate_kg_capita_year`: Waste from retail businesses.
- `food_service_estimate_kg_capita_year`: Waste from food services.
- `confidence_in_estimate`: Confidence level of data (Very Low, Low, Medium, High).
- `region`: Geographical region of the country.

## 🧹 Data Cleaning

- **Column Renaming:** Simplified column names for coding clarity.
- **Missing Values:** No missing entries found.
- ✅ Output saved as: `cleaned_food_waste_data.csv`

## 📊 Exploratory Data Analysis (EDA)

Key insights from visual and statistical exploration:

### ✅ Household Waste Dominance
- Correlation of **+0.87** with total waste suggests household sector is the primary contributor.

<p align="center">
  <img src="correlation_heatmap.png" width="600"/>
</p>

### ⚠️ Confidence in Estimates
- Most estimates have **Very Low Confidence**, highlighting the need for better global data collection.

### 🌍 Regional Trends
- **High Waste Regions:** Western Asia, Sub-Saharan Africa (e.g., Nigeria, Rwanda).
- **Low Waste Regions:** Europe (e.g., Russia, Slovenia).

### 🎯 Waste Categorization:
| Category       | Range (kg/capita/year) | Countries |
|----------------|------------------------|-----------|
| 🟩 Low Waste    | < 100                  | 15        |
| 🟨 Medium Waste | 100–140                | 147       |
| 🟥 High Waste   | > 140                  | 52        |

## 🧠 SQL Analysis

Dataset treated as SQL table: `food_waste`

### Sample Queries & Analysis:
- Average waste per region (`GROUP BY`)
- Countries with highest/lowest household waste (`MAX` / `MIN`)
- Low-confidence data in high-waste countries (`WHERE`)
- Countries exceeding global average (`SUBQUERY`)

## 🛠️ Tools & Technologies

- **Language:** Python  
- **Data Manipulation:** Pandas  
- **Visualization:** Matplotlib, Seaborn  
- **Database Queries:** SQL  

---

📣 Feel free to reuse, extend, or refine this project for educational or policy research purposes.
