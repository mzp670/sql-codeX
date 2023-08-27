#  From a database containing at least one table named 'service_request,' create an SQL query to provide a list of agencies, 
#  along with the count of different complaint types they handle based on our data. The result should be ordered in descending order, 
#  starting with the agency that handles the most complaint types and ending with the agency that handles the least.

select 
  distinct agency_name, 
  count(distinct complaint_type) as complaint_type_count 
from service request xs
group by agency_name
order by complaint_type_count desc
