#Show first name and last name of patients that weight within the range of 100 to 120 (inclusive)


Solution 1; 

select
first_name,
last_name
from patients
where weight between 100 and 120

Solution 2;

SELECT
  first_name,
  last_name
FROM patients
WHERE weight >= 100 AND weight <= 120;