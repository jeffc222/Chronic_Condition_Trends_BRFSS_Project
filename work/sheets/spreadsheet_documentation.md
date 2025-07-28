# Spreadsheet Documentation
This document provides a structured overview of each tab within the brfss.xlsx spreadsheet. Each tab is explained with its purpose, contents, and relevance to the overall analysis process. Together, these annotations offer transparency into the data preparation, organization, and logic behind the visual and analytical outputs presented in this project.

## Original Tab
This tab contains the full cleaned dataset exported from BigQuery and serves as the foundation for all downstream analysis. It includes annual prevalence values for four chronic health indicators—**obesity, diabetes, smoking,** and **depression**—across five selected U.S. states **(California, Texas, Florida, New York, and Pennsylvania)** from 2012 to 2022.

For each condition, this dataset also includes the **prior year’s value** and the **calculated year-over-year (YoY) percent change**, allowing for clear comparisons over time. Although these columns are grouped by type (all prior-year values, then all YoY changes), they support accurate trend analysis and helped inform both summary statistics and Tableau visualizations.

## Summary Tab
This tab presents 10-year average prevalence values (2012–2022) for four chronic conditions—obesity, diabetes, smoking, and depression—across five U.S. states (CA, TX, FL, NY, PA). A top "National" row calculates the average across all five states for each indicator, serving as a reference benchmark.

Each subsequent row shows a state’s individual 10-year average for each condition. The final column flags whether the state’s average is above or below the overall benchmark, helping identify how each state compares to the group average.

## Obesity Tab

## 
