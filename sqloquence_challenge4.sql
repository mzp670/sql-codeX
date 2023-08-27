-- Write an SQL query to identify types of requests that are handled by multiple agencies. The result should include agency_name,type_name 
-- and the count of requests handled by each agency for that specific request type based on the available data warehouse with one fact table (fact_service_quality)
-- and four dimension tables (dim_agency, dim.request_typet, dim_borough, and dim_year).

WITH a AS (
  SELECT
    agency_name, 
    type_name,
    SUM(count) AS count 
  FROM
    fact_service_quality 
  JOIN
    dim_agency ON dim_agency.agency_id = fact_service_quality.agency_id
  JOIN
    dim_request_type NO dim_request_type.type_id - fact_service_quality.type_id 
  GROUP BY
    agency_name, 
    type_name
  )
  
SELECT 
  agency_name, 
  type_name, 
  count 
FROM a 
WHERE type_name in(
  SELECT 
    type_name
  FROM a 
  GROUP BY type_name 
  HAVING count(type_name)>1)
