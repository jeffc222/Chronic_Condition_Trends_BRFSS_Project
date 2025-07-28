-- Step 1: Filter relevant datas
-- Description: Extracts crude prevalence values (2012–2022) for 5 selected states across 4 health indicators: Obesity, Diabetes, Smoking, and Depression

WITH filtered_brfss AS (
  SELECT
    Year,
    LocationAbbr,
    LocationDesc,
    Topic,
    Response,
    Data_Value
  FROM `behavioralriskfactor.brfs.brfs12`
  WHERE
    Data_Value_Type = 'Crude Prevalence'
    AND Break_Out = 'Overall'
    AND Year BETWEEN 2012 AND 2022
    AND LocationAbbr IN ('TX', 'CA', 'FL', 'NY', 'PA')
    AND (
      (Topic = 'BMI Categories' AND Response LIKE '%Obese%') OR
      (Topic = 'Diabetes' AND Response = 'Yes') OR
      (Topic = 'Current Smoker Status' AND Response = 'Yes') OR
      (Topic = 'Depression' AND Response = 'Yes')
    )
),

-- Step 2: Pivot indicators into columns per year/state
-- Description: Transforms row-based responses into column format for each indicator (wide format)

pivoted AS (
  SELECT
    Year,
    LocationAbbr,
    LocationDesc,
    MAX(CASE WHEN Topic = 'BMI Categories' THEN Data_Value END) AS Obesity,
    MAX(CASE WHEN Topic = 'Diabetes' THEN Data_Value END) AS Diabetes,
    MAX(CASE WHEN Topic = 'Current Smoker Status' THEN Data_Value END) AS Smoking,
    MAX(CASE WHEN Topic = 'Depression' THEN Data_Value END) AS Depression
  FROM filtered_brfss
  GROUP BY Year, LocationAbbr, LocationDesc
),

-- Step 3: Join to previous year to calculate YoY changes
-- Description: Adds previous year's values for comparison and calculates year-over-year (YoY) percentage changes  

with_yoy AS (
  SELECT
    a.Year,
    a.LocationAbbr,
    a.LocationDesc,
    a.Obesity,
    a.Diabetes,
    a.Smoking,
    a.Depression,
    b.Obesity AS Obesity_Prev,
    b.Diabetes AS Diabetes_Prev,
    b.Smoking AS Smoking_Prev,
    b.Depression AS Depression_Prev,
    -- % change calculation (optional: ROUND to 2 decimal places)
    ROUND((a.Obesity - b.Obesity) / b.Obesity * 100, 2) AS Obesity_YoY,
    ROUND((a.Diabetes - b.Diabetes) / b.Diabetes * 100, 2) AS Diabetes_YoY,
    ROUND((a.Smoking - b.Smoking) / b.Smoking * 100, 2) AS Smoking_YoY,
    ROUND((a.Depression - b.Depression) / b.Depression * 100, 2) AS Depression_YoY
  FROM pivoted a
  LEFT JOIN pivoted b
    ON a.LocationAbbr = b.LocationAbbr AND a.Year = b.Year + 1
)

-- Step 4: Return clean final dataset
-- Description: Outputs the final table ordered by state and year for analysis and visualization  

SELECT *
FROM with_yoy
ORDER BY LocationAbbr, Year;
