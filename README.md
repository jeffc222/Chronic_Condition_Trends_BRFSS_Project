# Chronic Condition Trends (2012-2022): A Decade of Health Across Five U.S. States

## Overview
This project explores 10-year trends in key chronic conditions—**obesity, diabetes, smoking,** and **depression**—across five of the most populous and diverse U.S. states: **California, Texas, Florida, New York, and Pennsylvania.** Using public health survey data from the **[CDC Behavioral Risk Factor Surveillance System (BRFSS)](data/data_link.md)**, the analysis identifies long-term shifts in crude prevalence and highlights regional differences in physical and behavioral health burdens.

The goal is to surface actionable public health patterns and offer data-driven recommendations that can inform planning, resourcing, and intervention strategies at the state level.

## Objectives
* Track decade-long trends in chronic health conditions from 2012 to 2022
* Compare health burden patterns across five high-population U.S. states
* Highlight directional changes and national benchmark comparisons
* Create interactive, filterable visualizations for public health decision-makers

## Dataset Structure
The dataset originates from the CDC BRFSS (Behavioral Risk Factor Surveillance System) and was manipulated via Google Cloud’s BigQuery platform. The final dataset includes:
* **Timeframe:** 2012–2022 (excluding Florida in 2021 due to official CDC omission)
* **States:** California, Texas, Florida, New York, Pennsylvania
* **Indicators:** Obesity, Diabetes, Smoking, Depression
* **Measure Type:** Crude Prevalence
* **Population Group:** Overall (no subgroup breakdowns)

These indicators were selected for their consistency across BRFSS and CDC PLACES reporting and their relevance to both physical and behavioral health. Crude prevalence rates were used for comparability with other public datasets and to simplify interpretation for non-technical stakeholders.





## Technical Process
### Data Extraction (SQL)
* Queried BRFSS dataset in BigQuery
* Filtered for:
  * Indicator: Obesity, Diabetes, Smoking, Depression
  * Breakout: Overall
  * Measure Type: Crude Prevalence
  * States: CA, TX, FL, NY, PA
  * Years: 2012–2022
* Used CTEs and filters to prepare a clean, analysis-ready table
* Exported the final output to Google Sheets

For full SQL queries, click [here].(work/sql_queries.sql)

### Google Sheets Processing
* Calculated year-over-year (YoY) percent changes for each condition by state
* Applied conditional formatting to highlight increases or decreases
* Created tabular summaries of trends by condition and by state
* Organized multiple tabs to streamline data validation and visualization prep

For 

### Visualization in Tableau
* Built interactive line charts to visualize state-level trends for each condition
* Enabled filtering by state and condition
* Annotated major trend shifts for clarity and public health relevance
* Streamlined visual design to allow quick comparison across time

Explore the Tableau dashboard here



## Major Insights
* Obesity and diabetes steadily increased across all five states from 2012 to 2022, with Texas and Pennsylvania showing the steepest rises.
* Smoking declined in all states, with California and New York leading in reduction, suggesting effective anti-smoking initiatives.
* Depression rates rose across all five states, most sharply in New York and Florida, indicating growing mental health challenges during the last decade.
* Texas consistently showed higher-than-average rates in all four indicators, while California maintained the lowest obesity and smoking rates throughout the period.
* These trends reflect long-term shifts that carry serious implications for healthcare systems, state policies, and local community health initiatives.


## Visualization
* Interactive Tableau Dashboard: Explore a decade of trends across obesity, diabetes, smoking, and depression for each state.
* Condition-Specific Line Charts: Small multiple views for each condition allow focused analysis by state over time.
* State Comparisons: Line overlays reveal how each state’s trajectory compares to others on each indicator.

📊 Click here to view the interactive dashboard
🖼️ See static previews in the /images folder


## Recommendations 
* Targeted Health Campaigns: Focus on obesity and diabetes prevention in Texas and Pennsylvania, where rates continue to climb.
* Expand Mental Health Access: Prioritize depression-related services in New York and Florida, especially post-2020.
* Reinforce Anti-Smoking Programs: Continue investment in states like California and New York to maintain downward momentum in smoking.
* Integrate Data Monitoring: Use BRFSS updates annually to guide real-time public health decisions at the state level.

## Action Plan
* Policy Advocacy: Use decade-long trends to inform state health departments and legislators
* Public Education: Highlight state-specific trends in community health campaigns
* Ongoing Monitoring: Refresh analysis yearly as new BRFSS data is released

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

## Disclaimer
This project is for educational and portfolio purposes only. The dataset is publicly available from the [CDC Behavioral Risk Factor Surveillance System (BRFSS)](data/data_link.md). All rights and data belong to the original source.





