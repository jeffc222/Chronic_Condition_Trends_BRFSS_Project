# Chronic Condition Trends (2012-2022): A Decade of Public Health Across Five U.S. States

## Overview
This project analyzes 10 years of trends in four major chronic health conditions: **obesity, diabetes, smoking, and depression**. Public health data from the **[CDC Behavioral Risk Factor Surveillance System (BRFSS)](data/data_link.md)** was used to examine changes from 2012 to 2022 across the five most populous U.S. states: **California, Texas, Florida, New York, and Pennsylvania.** 

The goal is to identify long-term shifts in health outcomes, compare state-level patterns to national averages, and pinpoint areas where public health efforts may be most needed. The analysis is designed to help health agencies and decision-makers respond to emerging trends. 

## Objectives
* Track how **obesity, diabetes, smoking, and depression** changed from 2012 to 2022
* Compare chronic health trends across five of the most populous U.S. states
* Identify states that consistently perform above or below national averages
* Highlight shifts that may require targeted public health action
* Visualize state-level trends through an interactive dashboard designed for public health insights

## Dataset Structure
The dataset originates from the **[CDC BRFSS (Behavioral Risk Factor Surveillance System)](data/data_link.md)** and was processed using Google BigQuery. The raw data was filtered and reshaped to create a clean state-year structure suitable for trend analysis and visualization. 

The final dataset includes:
* **Timeframe:** 2012–2022 (excluding Florida in 2021 due to official CDC omission)
* **States:** California, Texas, Florida, New York, and Pennsylvania
* **Indicators:** Obesity, Diabetes, Smoking, Depression
* **Measure Type:** Crude Prevalence
* **Population Group:** Overall (no demographic subgroups)

The original BRFSS data was structured in **long format**, with each row representing a unique combination of year, state, condition, and prevalence value. Using SQL, the data was pivoted into **wide format**, where each row corresponded to a single year-state pair with separate columns for each health indicator. A **self-join** was applied to calculate **prior-year values** and **year-over-year (YoY) percentage changes**, supporting multi-year comparisons across all five states. 

For detailed filtering logic and SQL transformation steps, see [notes](work/data_notes.md).

![table](images/brfsstable.png)


## Technical Process
### Data Extraction (SQL)
Public BRFSS data was queried directly from Google Cloud's BigQuery platform. The fitlering criteria included:
  * **Indicators:** Obesity, Diabetes, Smoking, Depression
  * **States:** CA, TX, FL, NY, PA
  * **Years:** 2012–2022
  * **Population Group:** Overall
  * **Measure Type:** Crude Prevalence
Common Table Expressions (CTEs) were used to organize logic, and pivot logic (MAX(CASE WHEN...)) was applied to reshaped the data into wide format. A self-join was performed to calculate prior-year values and year-over-year (YoY) percentage changes. The cleaned dataset was sorted by year and state, then exported to Google Sheets for further processing.

[View SQL queries](work/sql_queries.sql)


### Data Processing (Google Sheets)
The exported dataset was processed in Google Sheets to finalize calculations and prepare visualization. Key steps included:
* Applied conditional formatting to flag increases and decreases
* Calculated YoY percent changes by state and condition
* Segmented data by condition for focused review
* Created pivot tables for trend summaries and internal validation
* Handled Florida's missing 2021 data by adjusting averaging logic


[View spreadsheet and notes](work/spreadsheet)


### Visualization (Tableau)
An interactive dashboard was built in Tableau to help stakeholders explore state-level trends. The dashboard includes:
* Created interactive line charts to visualize 10-year trends by condition and state
* Added a constant dashed line to show the 5-state average as a benchmark
* Enabled filtering by state for flexible comparison
* Kept tooltips simple and clean to highlight year, state, and prevalence value

## Visualizations
This project's final output is a Tableau dashboard designed to explore 10-year trneds across four key chronic health indicators- obesity, diabetes, smoking, and depression- in five U.S. states. Visualizaitons were structured to support side-by-side comparions and focused state-level analysis. 

**Interactive Dahsboard**
Explore dynamic line charts by condition and state, with fitler controls and "national" average benchmarks:
[View the interactive dashboard here](https://public.tableau.com/views/brfss2/ChronicConditionTrendsinFiveU_S_States2012-2022?:language=en-US&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link).

**Condition-Specific Line Charts**
Small multiple views (one per condition) allow users to:
* Compare each state's trend over time
* Spot diverging or converging trajectories
* Assess shifts relative to the group average

Each chart includes:
* State-level fitler dropdown
* Dashed reference line representing the 10-year average across all five states
* Clear axis labels and hover tooltips for value lookup

 **Static Chart Previews**
 Preview each condition trends below:









## Major Insights
* Obesity and diabetes steadily increased across all five states from 2012 to 2022, with Texas and Pennsylvania showing the steepest rises.
* Smoking declined in all states, with California and New York leading in reduction, suggesting effective anti-smoking initiatives.
* Depression rates rose across all five states, most sharply in New York and Florida, indicating growing mental health challenges during the last decade.
* Texas consistently showed higher-than-average rates in all four indicators, while California maintained the lowest obesity and smoking rates throughout the period.
* These trends reflect long-term shifts that carry serious implications for healthcare systems, state policies, and local community health initiatives.

Key Insights
Obesity and diabetes rates steadily increased across most states, especially in Texas and Pennsylvania, pointing to rising metabolic and lifestyle health risks.

Smoking declined in all five states over the decade, with California and New York leading the reductions—suggesting strong public health policy impact.

Depression prevalence increased across the board, most notably in Florida and New York, indicating a potential surge in behavioral health needs.

Texas consistently exhibited above-average rates across all four indicators, while California remained below the national average in obesity and smoking throughout the 10-year period.

Florida’s 2021 data was officially excluded from BRFSS, but this gap was documented and accounted for in calculations and interpretations.

These trends reflect widening disparities and changing burdens across both physical and mental health domains.





## Recommendations 
* Targeted Health Campaigns: Focus on obesity and diabetes prevention in Texas and Pennsylvania, where rates continue to climb.
* Expand Mental Health Access: Prioritize depression-related services in New York and Florida, especially post-2020.
* Reinforce Anti-Smoking Programs: Continue investment in states like California and New York to maintain downward momentum in smoking.
* Integrate Data Monitoring: Use BRFSS updates annually to guide real-time public health decisions at the state level.



Recommendations
Address Obesity and Diabetes Growth: Focus prevention and intervention efforts in Texas and Pennsylvania where metabolic conditions are rising the fastest.

Support Mental Health Expansion: Prioritize behavioral health funding in Florida and New York in response to increasing depression trends.

Sustain Anti-Smoking Success: Reinforce effective public health strategies in California and New York to maintain progress.

Integrate Data Monitoring: Use ongoing BRFSS releases to track future shifts and adapt public health programs based on real-time trends.


## Action Plan
* Policy Advocacy: Use decade-long trends to inform state health departments and legislators
* Public Education: Highlight state-specific trends in community health campaigns
* Ongoing Monitoring: Refresh analysis yearly as new BRFSS data is released


Action Plan
Report Findings: Share visual dashboards with state health departments and policy partners

Target Interventions: Deploy regional campaigns tailored to condition-specific burdens

Refine Over Time: Update dashboards and trend models as new BRFSS data becomes available

## Repository Contents
* README.md – Project overview, technical steps, insights, and recommendations
* data/ – Dataset metadata and external dataset link
  * dataset_link.md – Link to CDC BRFSS SMART dataset via BigQuery
* work/ – Project work files: SQL queries, spreadsheet files
  * sql_queries.sql – BigQuery SQL code used for data filtering and cleaning
  * data_notes.md – Detailed justification of filtering, logic, and data processing choices
  * sheets/ - Spreadsheet and spreadsheet documentation
    * brfss.xlsx – Final spreadsheet with trends and YoY calculations
* images/ – Visual outputs and static chart images
  * obesity_trend.png
  * smoking_trend.png
  * dashboard_preview.png

Repository Contents
README.md – Project overview, methodology, insights, and recommendations

data/ – Dataset summary and external data source reference

dataset_link.md – Direct link to the CDC BRFSS dataset via BigQuery

work/ – Project artifacts, including:

sql_queries.sql – SQL logic for filtering and transformation

BRFSS_trends.xlsx – Cleaned data with all calculations and checks

data_notes.md – Full documentation of technical process and rationale

images/ – Visualization outputs and condition-specific snapshots

obesity_trend.png, smoking_trend.png, dashboard_preview.png, etc.


## Disclaimer
This project is for educational and portfolio purposes only. The dataset is publicly available from the [CDC Behavioral Risk Factor Surveillance System (BRFSS)](data/data_link.md). All rights and data belong to the original source.
















