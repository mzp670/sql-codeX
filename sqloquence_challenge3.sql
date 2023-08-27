-- Write an SQL query that, for each year, displays the number of requests assigned to NYPD as 'NYPD_request_count' 
-- and compares it to the number of requests in the previous year, based on the structure of a data warehouse with one fact table 
-- (fact_service_quality) and four dimension tables (dim_agency, dim.request_typet, dim_borough and dim_year).

WITH A AS (
  SELECT year
  SUM(count) AS NYPD_request_count
FROM 
  fact_service_quality
JOIN 
  dim_agency ON dim_agency.agency_id = fact_service_quality.agency_id 
WHERE agency_name = 'NYPD'
GROUP BY year
  )

SELECT 
  A.year, 
  A.NYPD_request_count,
  CASE WHEN B.NYPD_request_count IS NULL THEN 'NO DATA'
    ELSE B.NYPD_request_count = A.NYPD_request_count
    END AS change_this_year
FROM A
LEFT JOIN A AS B ON A.year -1 = B.year
ORDER BY A.year
