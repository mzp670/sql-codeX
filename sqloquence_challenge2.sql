-- Write an SQL query to find, for each borough (borough_name), its most common request type and the total count of those requests as top_request_type, 
--  along with the total_count value in a data warehouse with one fact table (fact_service_quality) and four dimension tables 
-- (dim_agency, dim.request_typet, dim_borough, and dim_year).

WITH A AS (
SELECT 
  DISTINCT borough_name, 
  type_name AS top_request_type, 
  sum(count) AS total_count, 
  ROW_NUMBER() OVER (PARTITION BY borough_name ORDER BY sum(count) desc) AS top
FROM 
  fact service quality
JOIN 
  dim_borough ON dim_borough.borough_id = fact_service_quality.borough_id
JOIN 
  dim_request_type ON dim_request_type.type_id = fact_service_quality.type_id
GROUP BY
  borough_name, 
  type_name
  )
  
SELECT 
  borough_name, 
  top_request_type,
  total_count 
FROM a
