# Context
This project investigates time trends in chronic health conditions using the **CDC BRFSS (Behavioral Risk Factor Surveillance System)** dataset. The goal is to track how **obesity, diabetes, smoking, and depression** have evolved between **2012** and **2022** across five key U.S. states: **California, Texas, Florida, New York, and Pennsylvania.**

The analysis combines **SQL, Google Sheets,** and **Tableau** to clean, process, visualize, and interpret multi-year health prevalence data. This documentation outlines the thought process, step-by-step decisions, and technical methodology that guided the project from raw data to final insights.

## Summary
This file outlines the full workflow behind the BRFSS chronic condition analysis project, documenting how raw survey data was transformed into clean, structured, and visual-ready insights. It covers SQL extraction and transformation, spreadsheet-based calculations and validation, and Tableau dashboard preparation. Each step reflects best practices in analytical documentation and mirrors common workflows in real-world healthcare analytics roles.

--- 

# Step 1: Data Extraction (SQL via BigQuery)
**Objective:** Filter for relevant data by year, location, and health indicators

**Key Criteria:**
* **Data_Value_Type:** Crude Prevalence
* **Break_Out:** Overall population
* **Years:** 2012–2022
* **States:** TX, CA, FL, NY, PA
* **Indicators:** Obesity, Diabetes, Smoking, Depression
    * ***Topics/Responses:***
        * BMI Categories → Obese
        * Diabetes → Yes
        * Current Smoker Status → Yes
        * Depression → Yes

*Rationale:*
* **Crude Prevalence:** Crude prevalence values reflect raw estimates without adjustments for age or demographic weighting. These unadjusted figures are directly comparable across years and are consistent with the format used in the CDC PLACES Local 2024 dataset.
* **Overall:** This ensures the dataset reflects population-wide estimates rather than subgroups (e.g., by gender or race), simplifying comparisons across states and reducing noise from demographic variance.
* **2012 to 2022:** This decade spans the most recent, complete 11-year period available that aligns closely with the 2024 CDC PLACES Local release which uses 2022 BRFSS data. 
* **CA, TX, FL, NY, PA:** These five states were chosen due to their large and diverse populations, ensuring broader representativeness. Their size and geographic spread also allow for meaningful comparisons across regions with varying health trends and public health infrastructures.
* **Obesity, Diabetes, Smoking, Depression:** These four indicators were selected to capture a balance between physical (obesity and diabetes) and behavioral (smoking and depression) health trends, allowing for holistic evaluation of chronic disease burden.

**SQL Approach:**
1. Filter relevant rows using **WHERE** clauses targeting indicator, response type, and state-year constraints.
2. Pivot the data to transform rows into columns for each indicator using **MAX(CASE WHEN...)** logic.
3. Calculate Year-over-Year (YoY) percent changes by joining each row with its prior year using **LEFT JOIN** and computing the delta as a percent.
4. Export final dataset chronologically by state and year including current year, prior-year values, and YoY percent change columns for each condition.

*Rationale:*
This modular, multi-CTE SQL approach was chosen for clarity, performance, and reusability. Filtering early reduces data volume, improving efficiency. Pivoting the indicators into columns using **MAX(CASE WHEN...)** makes the dataset easier to analyze and visualize downstream. Calculating YoY changes through a self-join enables longitudinal comparisons while preserving the row-level structure. Sorting the final output by state and year ensures intuitive chronological readability for both manual review and spreadsheet-based analysis.

[View SQL queries]sql_queries.sql).

--- 

# Step 2: Data Processing (Google Sheets)
**Objective:** Organize and explore the SQL-exported dataset using spreadsheet tools for further analysis, validation, and visualization preparation

**Key Tabs & Structure:**
* **Original:** Contains the full cleaned export from BigQuery, including yearly prevalence rates for each condition (obesity, diabetes, smoking, depression) from 2012–2022 across five selected states. Also includes calculated prior-year values and year-over-year (YoY) percent changes to support longitudinal trend analysis.
* **Summary:** Presents average prevalence rates for each condition per state across the 10-year period. The “National” column reflects the 10-year average across all five states combined per condition. Each state’s row displays its own 10-year average and whether it is above or below the national benchmark. This helped anchor state-level comparisons in context.
* **Obesity / Diabetes / Smoking / Depression:** These four tabs isolate each individual condition for deeper inspection. Each tab includes:
  * Annual values and Year-over-Year percent change values by state from 2012–2022
  * State-specific 10-year averages
  * National benchmark for the same period
  * Conditional formatting to highlight states above/below the benchmark using:
    * =D2>$D$13 → Above national average
    * =D2<=$D$13 → Below national average
  * These formatting rules made trends immediately visible for visual review.
* **OPT, DIPT, SPT, DEPT (e.g. Obesity Pivot Tables):** Pivot tables were used to cross-validate the average calculations. Grand Totals in each pivot matched the AVERAGEIFS results from earlier tabs, reinforcing confidence in data quality and spreadsheet fluency. Example:
  * National Average: =AVERAGEIFS(D2:D, D2:D, "<>")
  * State Average (e.g. CA): =AVERAGEIFS(D2:D, B2:B, "CA", D2:D, "<>")

  The inclusion of both formula-based and pivot table-based calculations demonstrates a well-rounded understanding of when to apply each method. Formulas are used for quick and flexible checks, while pivot tables are used for structured aggregation, filtering, and presentation.
* **OYPT, DIYPT, SYPT, DEYPT (e.g. Obesity YoY Pivot Tables):** Year-over-year percent change values were organized into pivot tables by state and year. Though not included in the final visualizations, they revealed trends such as:
  * Mild decline in Florida's depression rate, which contrasted with rising trends elsewhere
  * Smoking showed consistent YoY declines across all states.
  * Obesity and diabetes showed consistent positive growth in most areas.

  These pivot tables were retained for potential future insight generation or to support refined recommendations.

**Rationale:**
Organizing the dataset in Google Sheets provided a structured and interactive environment for validating data accuracy, exploring trends, and preparing content for visualization. Each indicator was separated into its own tab to support focused analysis and clear formatting. Average values were cross-validated using both formulas and pivot tables to ensure consistency and analytical rigor.

This step also enabled early identification of data gaps and anomalies, such as Florida’s missing 2021 values, which were flagged and considered in interpretation. Leveraging spreadsheets for pre-visualization processing reflects common workflows in analytics teams and enhances auditability, transparency, and collaboration throughout the project.

For a full breakdown of each tab—including descriptions, formulas used, and conditional formatting logic—see the dedicated documentation [here](sheets/spreadsheet_documentation.md).

--- 

# Step 3: Data Preparation & Visualization in Tableau
* **Objective:** Create intuitive and informative trend visualizations for each health indicator across five states using a simplified dataset

* **Dataset Simplification for Tableau:** To prepare the dataset for visualization, all derived metrics such as prior-year values and year-over-year (YoY) percentage change columns were excluded. This left only the essential columns required for trend analysis:
    * Year
    * LocationAbbr
    * LocationDesc
    * Obesity
    * Diabetes
    * Smoking
    * Depression

This simplification ensured a cleaner Tableau interface, free from metric redundancy, and optimized for time-series visualization.

* **Visualization Strategy:** The streamlined dataset was imported into Tableau, where the focus was placed on producing clear, comparative visuals across the four health conditions. Line charts were used to display each condition’s trend over time by state. A  filter was added to allow users to toggle between states for each condition-specific chart.

A constant dashed line was also added to represent the 10-year national average for each indicator, serving as a benchmark for comparison. Custom labels and tooltips were included to support quick interpretation and provide context to non-technical viewers.

* **Rationale:** Simplifying the dataset allowed for a more focused and intuitive visualization experience. By prioritizing absolute prevalence values over derived metrics, the visualizations remained accessible to a broader audience while still supporting meaningful trend comparisons. This approach mirrors common dashboard development practices, where clarity, usability, and stakeholder relevance are key.

The finalized Tableau dashboard can be viewed [here](https://public.tableau.com/views/brfss2/ChronicConditionTrendsinFiveU_S_States2012-2022?:language=en-US&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link).

---

## 📌 Florida Data Caveat (Missing 2021)
Florida did not meet the CDC’s data collection requirements for BRFSS in 2021 and was therefore excluded from the official 2021 annual dataset. According to the CDC: "Florida was unable to collect BRFSS data over enough months to meet the minimum requirements for inclusion in the 2021 annual aggregate data set." — [CDC BRFSS 2021 Comparison Report PDF](https://www.cdc.gov/brfss/annual_data/2021/pdf/compare_2021-508.pdf)

**Impact on Analysis:**
* **Standard Averages:** Florida’s indicator averages (e.g., obesity, smoking) were calculated over 10 years (2012–2020, 2022), instead of 11 for the other states
* **YoY Averages:** Year-over-year changes span only 8 intervals (2013–2022), compared to 10 for others
* **No Imputation Used:** This missing year was not filled or adjusted for; the discrepancy was documented in relevant spreadsheet tabs and accounted for in final insights

This gap in Florida’s data was acknowledged and factored into comparative analysis, particularly when interpreting trends or YoY dynamics involving Florida.

---

# Step 5: Insights and Decision Points
Several analytical decisions were informed by both data limitations and the scope of the project:
* **YoY Metrics:** Year-over-year percentage changes were not included in the Tableau dashboard, but the pivot tables remain valuable for interpreting directional shifts and will be referenced in future recommendations or insights where appropriate.
* **Florida’s Missing 2021 Data:** As detailed above, this affects both regular and YoY averages and was factored into interpretation when comparing trends across states.
* **Pivot Table Usage:** Pivot tables were used to validate manual calculations and supported internal QA. They reinforced understanding of multiple calculation approaches (formula-based vs. aggregation) and strengthened confidence in final values used for visualization.

