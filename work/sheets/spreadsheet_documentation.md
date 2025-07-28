# Spreadsheet Documentation
This document provides a structured overview of each tab within the **brfss.xlsx spreadsheet.** Each tab is explained with its purpose, contents, and relevance to the overall analysis process. Together, these annotations offer transparency into the data preparation, organization, and logic behind the visual and analytical outputs presented in this project.

## Original Tab
This tab contains the full cleaned dataset exported from BigQuery and serves as the foundation for all downstream analysis. It includes annual prevalence values for four chronic health indicators—**obesity, diabetes, smoking,** and **depression**—across five selected U.S. states **(California, Texas, Florida, New York, and Pennsylvania)** from 2012 to 2022.

For each condition, this dataset also includes the **prior year’s value** and the **calculated year-over-year (YoY) percent change**, allowing for clear comparisons over time. Although these columns are grouped by type (all prior-year values, then all YoY changes), they support accurate trend analysis and helped inform both summary statistics and Tableau visualizations.

## Summary Tab
This tab presents 10-year average prevalence values (2012–2022) for four chronic conditions—**obesity, diabetes, smoking,** and **depression**—across five U.S. states **(CA, TX, FL, NY, PA)**. A top "National" row calculates the average across all five states for each indicator, serving as a reference benchmark.

Each subsequent row shows a state’s individual 10-year average for each condition. The final column flags whether the state’s average is above or below the overall benchmark, helping identify how each state compares to the group average.

## Obesity Tab
This tab isolates annual **obesity** prevalence data from 2012 to 2022 for five selected U.S. states **(CA, TX, NY, FL, PA)**. It displays year-by-year crude prevalence rates along with calculated year-over-year (YoY) percentage changes for each state. These values support trend analysis and were used to build the Tableau visualizations.

In the second half of the tab, a summary table shows 10-year average **obesity** prevalence rates for each state, alongside an “overall” national average calculated across all five states. The following formulas were used:

* **"Overall" National average**: =AVERAGEIFS(D2:D, D2:D, "<>")
* **State-specific averages**: =AVERAGEIFS(D2:D, B2:B, "CA", D2:D, "<>") (replacing "CA" with each state abbreviation)

Conditional formatting highlights individual data points based on whether they are above or below the national average:
* **Red**: =D2>$G$2 → Above the national benchmark
* **Green**: =D2<=$G$2 → Below or equal to the benchmark

This formatting helps visually emphasize values that deviate from the 10-year average, aiding quick comparison across states and years.

## OPT Tab (Obesity Pivot Table)



## OYPT Tab (Obesity YoY Pivot Table)



## Diabetes Tab
This tab isolates annual **diabetes** prevalence data from 2012 to 2022 for five selected U.S. states **(CA, TX, NY, FL, PA)**. It displays year-by-year crude prevalence rates along with calculated year-over-year (YoY) percentage changes for each state. These values support trend analysis and were used to build the Tableau visualizations.

In the second half of the tab, a summary table shows 10-year average **diabetes** prevalence rates for each state, alongside an “overall” national average calculated across all five states. The following formulas were used:

* **"Overall" National average**: =AVERAGEIFS(D2:D, D2:D, "<>")
* **State-specific averages**: =AVERAGEIFS(D2:D, B2:B, "CA", D2:D, "<>") (replacing "CA" with each state abbreviation)

Conditional formatting highlights individual data points based on whether they are above or below the national average:
* **Red**: =D2>$G$2 → Above the national benchmark
* **Green**: =D2<=$G$2 → Below or equal to the benchmark

This formatting helps visually emphasize values that deviate from the 10-year average, aiding quick comparison across states and years.

## DIPT Tab (Diabetes Pivot Table)



## DIYPT (Diabetes Pivot Table) 

