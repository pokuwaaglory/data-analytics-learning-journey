SELECT 
    "gender",
    "race/ethnicity" AS demographic_group,
    "parental level of education" AS parent_education,
    "lunch" AS socioeconomic_status,
    "test preparation course" AS test_prep,
    "math score",
    "reading score",
    "writing score",
    -- 1. Calculate the overall average score for each student
    ROUND(("math score" + "reading score" + "writing score") / 3.0, 2) AS overall_average,
    
    -- 2. Categorize students into performance tiers for risk monitoring
    CASE 
        WHEN ("math score" + "reading score" + "writing score") / 3.0 >= 80 THEN 'Excellent (Top Tier)'
        WHEN ("math score" + "reading score" + "writing score") / 3.0 >= 60 THEN 'On Track (Passing)'
        ELSE 'Needs Intervention (At Risk)'
    END AS academic_standing_tier
FROM 'StudentsPerformance.csv';